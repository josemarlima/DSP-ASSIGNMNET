//Clint Stub
import ballerina/log;
import ballerina/grpc;

//This is client implematation for unary blocking

public function main (string... args) 
{
    //Client endpoint configuaration for una
    caliBlockingClient blockingEp = new("http://localhost:9090");

    //Create or save a record
    log:printInfo("--------------Writing a New Record -----------------");
    writeRecord recordReq = {id:"15421", date:"22","10","2020",name:"Winston Marshall",member:"Yes",band:"mumford & Sons",songs:"There will be time","Folks","Deezer"};
    var addResponse = caliBlockingClient ->saveRecord(recordReq);
    if(addResponse is error)
    {
       log:printError("Error from Connector: " + addResponse.reason() + " - "
                                                + <string>addResponse.detail()["message"] + "\n");
    }
    else 
    {
        string result;
        grpc:Headers resHeaders;
        [result, resHeaders] = addResponse;
        log:printInfo("Response - " + result + "\n");
    }





     // Update a Record
    log:printInfo("--------------------Update an Record -------------------");
     writeRecord recordReq = {id:"15421", date:"22","11","2020",name:"Josemar Lima",member:"No",band:"Nust",songs:"Coming home","Folks","Deezer"};
    var updateResponse = orderMgtBlockingEp->updateOrder(updateReq);
    if (updateResponse is error) {
        log:printError("Error from Connector: " + updateResponse.reason() + " - "
                                                + <string>updateResponse.detail()["message"] + "\n");
    } else {
        string result;
        grpc:Headers resHeaders;
        [result, resHeaders] = updateResponse;
        log:printInfo("Response - " + result + "\n");
    }



    // Read Record
    log:printInfo("---------------------Read an existing record---------------------");
    var findResponse = orderMgtBlockingEp->findOrder("15421");
    if (findResponse is error) {
        log:printError("Error from Connector: " + findResponse.reason() + " - "
                                                + <string>findResponse.detail()["message"] + "\n");
    } else {
        string result;
        grpc:Headers resHeaders;
        [result, resHeaders] = findResponse;
        log:printInfo("Response - " + result + "\n");
    }

}


