@interface XMLWrapperSchema
- (BOOL)validateDocument:(_xmlDoc *)a3 error:(id *)a4;
- (XMLWrapperSchema)initWithSchemaData:(id)a3;
- (void)dealloc;
@end

@implementation XMLWrapperSchema

- (XMLWrapperSchema)initWithSchemaData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)XMLWrapperSchema;
  v5 = [(XMLWrapperSchema *)&v11 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = v4;
  Memory = xmlReadMemory((const char *)[v6 bytes], objc_msgSend(v6, "length"), 0, 0, 0);
  if (!Memory)
  {
    NSLog(&cfstr_SchemaCouldNot.isa);
    goto LABEL_10;
  }
  defaultLoader = (uint64_t)xmlGetExternalEntityLoader();
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)XMLWExternalEntityLoader);
  v8 = xmlSchemaNewDocParserCtxt(Memory);
  if (!v8)
  {
    NSLog(&cfstr_FailedToCreate.isa);
    xmlFreeDoc(Memory);
LABEL_9:
    Memory = 0;
    goto LABEL_10;
  }
  v9 = v8;
  xmlSchemaSetParserErrors(v8, (xmlSchemaValidityErrorFunc)XMLWSchemaValidityError, (xmlSchemaValidityWarningFunc)XMLWSchemaValidityWarning, 0);
  v5->_schemaPtr = xmlSchemaParse(v9);
  xmlSchemaFreeParserCtxt(v9);
  xmlFreeDoc(Memory);
  if (!v5->_schemaPtr)
  {
    NSLog(&cfstr_SchemaIsNotVal.isa);
    goto LABEL_9;
  }
LABEL_5:
  Memory = v5;
LABEL_10:

  return (XMLWrapperSchema *)Memory;
}

- (void)dealloc
{
  schemaPtr = self->_schemaPtr;
  if (schemaPtr) {
    xmlSchemaFree(schemaPtr);
  }
  v4.receiver = self;
  v4.super_class = (Class)XMLWrapperSchema;
  [(XMLWrapperSchema *)&v4 dealloc];
}

- (BOOL)validateDocument:(_xmlDoc *)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    schemaPtr = self->_schemaPtr;
    if (schemaPtr)
    {
      xmlSchemaValidCtxtPtr v7 = xmlSchemaNewValidCtxt(schemaPtr);
      if (v7)
      {
        v8 = v7;
        v9 = [MEMORY[0x263F089D8] string];
        xmlSchemaSetValidErrors(v8, (xmlSchemaValidityErrorFunc)XMLWSchemaValidityErrorFunc, 0, v9);
        int v10 = xmlSchemaValidateDoc(v8, a3);
        BOOL v11 = v10 == 0;
        if (a4 && v10)
        {
          v12 = (void *)MEMORY[0x263F087E8];
          uint64_t v23 = *MEMORY[0x263F08320];
          v24[0] = v9;
          v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
          *a4 = [v12 errorWithDomain:@"XMLWrapperErrorDomain" code:100 userInfo:v13];
        }
        xmlSchemaFreeValidCtxt(v8);
        goto LABEL_11;
      }
      NSLog(&cfstr_FailedToCreate_0.isa);
      if (a4)
      {
        v14 = (void *)MEMORY[0x263F087E8];
        uint64_t v21 = *MEMORY[0x263F08320];
        v22 = @"Failed to create schema context";
        v15 = NSDictionary;
        v16 = &v22;
        v17 = &v21;
        goto LABEL_10;
      }
      return 0;
    }
  }
  NSLog(&cfstr_InvalidDocptrO.isa, a2);
  if (!a4) {
    return 0;
  }
  v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = *MEMORY[0x263F08320];
  v20 = @"Invalid docPtr or schemaPtr given for validating DOM Document";
  v15 = NSDictionary;
  v16 = &v20;
  v17 = &v19;
LABEL_10:
  v9 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
  [v14 errorWithDomain:@"XMLWrapperErrorDomain" code:100 userInfo:v9];
  BOOL v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

@end