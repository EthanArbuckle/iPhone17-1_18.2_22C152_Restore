@interface WFVariableFieldUtilities
+ (BOOL)clipboardContainsVariableString;
+ (BOOL)pasteboardContainsVariableString:(id)a3;
+ (id)serializedVariableStringFromPasteboard:(id)a3;
+ (void)copyVariableString:(id)a3 toPasteboard:(id)a4;
@end

@implementation WFVariableFieldUtilities

+ (id)serializedVariableStringFromPasteboard:(id)a3
{
  v3 = [a3 valueForPasteboardType:@"is.workflow.my.variablestring"];
  v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];

  return v4;
}

+ (void)copyVariableString:(id)a3 toPasteboard:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F08AC0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 serializedRepresentation];
  v9 = [v5 dataWithPropertyList:v8 format:200 options:0 error:0];

  v10 = [(id)*MEMORY[0x263F1DD38] identifier];
  v15[0] = v10;
  v11 = [v7 stringByReplacingVariablesWithNames];

  v15[1] = @"is.workflow.my.variablestring";
  v16[0] = v11;
  v16[1] = v9;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v14 = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  [v6 setItems:v13];
}

+ (BOOL)pasteboardContainsVariableString:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = @"is.workflow.my.variablestring";
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:&v7 count:1];
  LOBYTE(v3) = objc_msgSend(v4, "containsPasteboardTypes:", v5, v7, v8);

  return (char)v3;
}

+ (BOOL)clipboardContainsVariableString
{
  v3 = [MEMORY[0x263F82A18] generalPasteboard];
  LOBYTE(a1) = [a1 pasteboardContainsVariableString:v3];

  return (char)a1;
}

@end