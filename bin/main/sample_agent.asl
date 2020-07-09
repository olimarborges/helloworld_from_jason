+request(ResponseId, IntentName, Params, Contexts)
	:true
<-
	.print("Recebido request ",IntentName," do Dialog");
	!responder(ResponseId, IntentName, Params, Contexts);
	.
	
+!responder(ResponseId, IntentName, Params, Contexts)
	: (IntentName == "Call Jason Agent")
<-
	reply("Ol�, eu sou seu agente Jason, em que posso lhe ajudar?");
	.
	
+!responder(ResponseId, IntentName, Params, Contexts)
	: (IntentName == "Call With Contexts and Parameters")
<-
	.print("Os contextos e par�metros ser�o listados a seguir.");
	!printContexts(Contexts);
	!printParameters(Params);
	reply("Ol�, eu sou seu agente Jason, recebi seus contextos e par�metros");
	.
	
+!responder(ResponseId, IntentName, Params, Contexts)
	: true
<-
	reply("Desculpe, n�o reconhe�o essa intens�o");
	.

+!printContexts([]).
+!printContexts([Context|List])
<-
	.print(Context);
	!printContexts(List);
	.

+!printParameters([]).
+!printParameters([Param|List])
<-
	.print(Param)
	!printParameters(List)
	.
	
+!hello
    : True
<-
    .print("hello world");
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }