export const handler = async (event) => {
    console.log(event);
    return {
        statusCode: 200,
        body: new Date() + " --- updated",
    };
};
