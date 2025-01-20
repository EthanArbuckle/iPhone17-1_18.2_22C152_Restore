@interface VCSProperty
- (NSArray)values;
- (NSString)name;
- (VCSProperty)initWithName:(id)a3 rawValue:(id)a4 type:(unint64_t)a5;
- (VCSProperty)initWithName:(id)a3 rawValues:(id)a4 type:(unint64_t)a5;
- (VCSProperty)initWithName:(id)a3 value:(id)a4;
- (VCSProperty)initWithName:(id)a3 values:(id)a4;
- (VCSProperty)initWithVCSLine:(id)a3 parseState:(id)a4;
- (VCSPropertyValue)singleValue;
- (id)initClassificationProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initEncodedTextProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initISO8061DateListProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initISO8061Property:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initIntProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initKeywordListProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initRFC822AddressProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initRecurrenceProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initStatusProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initTranspProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
- (id)initURIProperty:(id)a3 withParseState:(id)a4 property:(id *)a5;
@end

@implementation VCSProperty

- (VCSProperty)initWithName:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCSProperty;
  v9 = [(VCSProperty *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = [v8 mutableCopy];
    values = v10->_values;
    v10->_values = (NSMutableArray *)v11;
  }
  return v10;
}

- (VCSProperty)initWithName:(id)a3 value:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[VCSProperty initWithName:values:](self, "initWithName:values:", v8, v9, v12, v13);
  return v10;
}

- (VCSProperty)initWithName:(id)a3 rawValues:(id)a4 type:(unint64_t)a5
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__VCSProperty_initWithName_rawValues_type___block_invoke;
  v11[3] = &__block_descriptor_40_e26___VCSPropertyValue_16__0_8l;
  v11[4] = a5;
  id v7 = a3;
  id v8 = objc_msgSend(a4, "VCS_map:", v11);
  v9 = [(VCSProperty *)self initWithName:v7 values:v8];

  return v9;
}

VCSPropertyValue *__43__VCSProperty_initWithName_rawValues_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[VCSPropertyValue alloc] initWithValue:v3 type:*(void *)(a1 + 32)];

  return v4;
}

- (VCSProperty)initWithName:(id)a3 rawValue:(id)a4 type:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    id v18 = v8;
    v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = a3;
    id v12 = [v10 arrayWithObjects:&v18 count:1];
    uint64_t v13 = -[VCSProperty initWithName:rawValues:type:](self, "initWithName:rawValues:type:", v11, v12, a5, v18, v19);

    objc_super v14 = v13;
  }
  else
  {
    id v15 = a3;
    v16 = [(VCSProperty *)self initWithName:v15 rawValues:MEMORY[0x1E4F1CBF0] type:a5];

    objc_super v14 = v16;
  }

  return v14;
}

- (VCSProperty)initWithVCSLine:(id)a3 parseState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 tokenID];
  uint64_t v9 = [v7 context];
  v10 = +[VCSParsedLine lookupProperty:v8];
  if (!v10)
  {
    uint64_t v13 = VCSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VCSProperty initWithVCSLine:parseState:](v6);
    }
    goto LABEL_9;
  }
  id v11 = v10;
  if ((v10->var1 & v9) == 0)
  {
    uint64_t v13 = VCSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VCSProperty initWithVCSLine:parseState:](v6);
    }
LABEL_9:

LABEL_10:
    objc_super v14 = 0;
    goto LABEL_28;
  }
  switch(v10->var2)
  {
    case 5uLL:
      id v12 = [(VCSProperty *)self initIntProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 7uLL:
      id v12 = [(VCSProperty *)self initISO8061Property:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 8uLL:
      id v12 = [(VCSProperty *)self initRFC822AddressProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 9uLL:
      id v12 = [(VCSProperty *)self initStatusProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0xAuLL:
      id v12 = [(VCSProperty *)self initEncodedTextProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0xBuLL:
      id v12 = [(VCSProperty *)self initRecurrenceProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0xCuLL:
      id v12 = [(VCSProperty *)self initISO8061DateListProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0xDuLL:
      id v12 = [(VCSProperty *)self initKeywordListProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0xEuLL:
      id v12 = [(VCSProperty *)self initURIProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0x11uLL:
      id v12 = [(VCSProperty *)self initClassificationProperty:v6 withParseState:v7 property:v10];
      goto LABEL_26;
    case 0x12uLL:
      id v12 = [(VCSProperty *)self initTranspProperty:v6 withParseState:v7 property:v10];
LABEL_26:
      uint64_t v19 = (VCSProperty *)v12;
      goto LABEL_27;
    case 0x13uLL:
      v21 = [v7 currentEntity];
      v22 = [[VCSAlarm alloc] initWithLine:v6 parseState:v7 property:v11];
      [v21 addChildEntity:v22];

      goto LABEL_10;
    default:
      self = [(VCSProperty *)self init];
      *((void *)&v15 + 1) = v8;
      *(void *)&long long v15 = v8 - 8;
      switch((unint64_t)(v15 >> 1))
      {
        case 0uLL:
          id v16 = [v6 content];
          int v17 = strcmp((const char *)[v16 bytes], "PalmDesktop Generated");

          if (!v17)
          {
            id v18 = VCSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              -[VCSProperty initWithVCSLine:parseState:].cold.6(v18);
            }

            [v7 setPalmImport:1];
          }
          goto LABEL_55;
        case 1uLL:
          id v23 = [v6 content];
          int v24 = strcmp((const char *)[v23 bytes], "1.0");

          if (!v24) {
            goto LABEL_55;
          }
          v25 = VCSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[VCSProperty initWithVCSLine:parseState:].cold.5(v6);
          }

          [v7 setStatus:2];
          goto LABEL_10;
        case 2uLL:
          v26 = [v6 params];
          v27 = [v26 objectForKey:@"VALUE"];
          v28 = v27;
          if (v27)
          {
            if ([v27 isEqual:@"URL"])
            {
              v29 = (void *)MEMORY[0x1E4F1CB10];
              v30 = NSString;
              id v31 = [v6 content];
              v32 = objc_msgSend(v30, "stringWithUTF8String:", objc_msgSend(v31, "bytes"));
              v33 = [v29 URLWithString:v32 encodingInvalidCharacters:0];
            }
            else
            {
              if (![v28 isEqual:@"CONTENT-ID"])
              {
LABEL_51:
                v33 = VCSLogHandle();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                  -[VCSProperty initWithVCSLine:parseState:].cold.4(v33);
                }
                goto LABEL_53;
              }
              id v31 = (id)[@"CID:" mutableCopy];
              id v39 = [v6 content];
              v40 = (const char *)[v39 bytes];

              if (*v40 == 60 && v40[strlen(v40) - 1] == 62)
              {
                v41 = [NSString stringWithUTF8String:v40 + 1];
                [v31 appendString:v41];

                objc_msgSend(v31, "deleteCharactersInRange:", objc_msgSend(v31, "length") - 1, 1);
              }
              else
              {
                v42 = [NSString stringWithUTF8String:v40];
                [v31 appendString:v42];
              }
              v33 = [MEMORY[0x1E4F1CB10] URLWithString:v31 encodingInvalidCharacters:0];
            }

            if (v33)
            {
              id var4 = v11->var4;
              v44 = [[VCSAttachment alloc] initWithURL:v33];
              self = [(VCSProperty *)self initWithName:var4 value:v44];

              goto LABEL_53;
            }
            goto LABEL_51;
          }
          v33 = VCSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[VCSProperty initWithVCSLine:parseState:](v33);
          }
LABEL_53:

LABEL_54:
LABEL_55:
          uint64_t v19 = self;
LABEL_27:
          self = v19;
          objc_super v14 = v19;
          break;
        case 9uLL:
          v26 = [v6 convertedContent];
          v28 = [v26 componentsSeparatedByString:@"; "];
          v34 = [[VCSPropertyValue alloc] initWithValue:v28 type:3];
          v35 = [v6 params];
          v36 = [v35 objectForKeyedSubscript:@"VALUE"];
          v37 = v36;
          if (v36 && [v36 isEqual:@"URL"])
          {
            v38 = [(VCSProperty *)self singleValue];
            [(VCSPropertyValue *)v34 addParameter:@"ALTREP" withValue:v38];
          }
          self = [(VCSProperty *)self initWithName:v11->var4 value:v34];

          goto LABEL_54;
        default:
          goto LABEL_55;
      }
      break;
  }
LABEL_28:

  return v14;
}

- (id)initISO8061Property:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7 = a3;
  id v8 = a5->var4;
  uint64_t v9 = [VCSDate alloc];
  id v10 = [v7 content];
  id v11 = -[VCSDate initWithDateString:](v9, "initWithDateString:", [v10 bytes]);

  if (!v8)
  {
    id v8 = [v7 keyword];
  }
  id v12 = [(VCSProperty *)self initWithName:v8 rawValue:v11 type:7];

  return v12;
}

- (id)initISO8061DateListProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7 = a3;
  id v8 = a5->var4;
  uint64_t v9 = [v7 content];
  id v10 = +[VCSDate dateListFromData:v9];

  if (!v8)
  {
    id v8 = [v7 keyword];
  }
  id v11 = [(VCSProperty *)self initWithName:v8 rawValues:v10 type:7];

  return v11;
}

- (id)initEncodedTextProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7 = a3;
  id v8 = a5->var4;
  if (!v8)
  {
    id v8 = [v7 keyword];
  }
  uint64_t v9 = [v7 convertedContent];
  id v10 = [(VCSProperty *)self initWithName:v8 rawValue:v9 type:3];

  return v10;
}

- (id)initIntProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5->var4;
  if (!v10)
  {
    id v10 = [v8 keyword];
  }
  unsigned int v16 = 0;
  id v11 = [v8 content];
  int v12 = sscanf((const char *)[v11 bytes], "%d", &v16);

  if (v12 == 1)
  {
    uint64_t v13 = [NSNumber numberWithInt:v16];
    self = [(VCSProperty *)self initWithName:v10 rawValue:v13 type:4];
    objc_super v14 = self;
  }
  else
  {
    uint64_t v13 = VCSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VCSProperty initIntProperty:withParseState:property:]((uint64_t)v10, v8, v13);
    }
    objc_super v14 = 0;
  }

  return v14;
}

- (id)initURIProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7 = a3;
  id v8 = a5->var4;
  if (!v8)
  {
    id v8 = [v7 keyword];
  }
  id v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = NSString;
  id v11 = [v7 content];
  int v12 = objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "bytes"));
  uint64_t v13 = [v9 URLWithString:v12 encodingInvalidCharacters:0];

  objc_super v14 = [(VCSProperty *)self initWithName:v8 rawValue:v13 type:6];
  return v14;
}

- (id)initClassificationProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5->var4;
  if (!v10)
  {
    id v10 = [v8 keyword];
  }
  id v11 = [v8 content];
  int v12 = (const char *)[v11 bytes];

  if (!strcmp(v12, "PUBLIC"))
  {
    uint64_t v13 = 0;
  }
  else if (!strcmp(v12, "PRIVATE"))
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 2 * (strcmp(v12, "CONFIDENTIAL") == 0);
  }
  objc_super v14 = [NSNumber numberWithUnsignedInteger:v13];
  long long v15 = [(VCSProperty *)self initWithName:v10 rawValue:v14 type:2];

  return v15;
}

- (id)initStatusProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5->var4;
  if (!v10)
  {
    id v10 = [v8 keyword];
  }
  id v11 = [v8 content];
  int v12 = (const char *)[v11 bytes];

  if (!strcmp(v12, "TENTATIVE"))
  {
    uint64_t v13 = 0;
  }
  else if (!strcmp(v12, "CONFIRMED"))
  {
    uint64_t v13 = 1;
  }
  else if (!strcmp(v12, "NEEDS ACTION"))
  {
    uint64_t v13 = 2;
  }
  else
  {
    if (strcmp(v12, "COMPLETED"))
    {
LABEL_13:
      int v17 = 0;
      goto LABEL_14;
    }
    uint64_t v13 = 3;
  }
  objc_super v14 = [v9 currentEntity];
  int v15 = [v14 isValidStatus:v13];

  if (!v15) {
    goto LABEL_13;
  }
  unsigned int v16 = [NSNumber numberWithUnsignedInteger:v13];
  self = [(VCSProperty *)self initWithName:v10 rawValue:v16 type:0];

  int v17 = self;
LABEL_14:

  return v17;
}

- (id)initRecurrenceProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5->var4;
  id v11 = [VCSRecurrenceRule alloc];
  id v12 = [v8 content];
  uint64_t v13 = -[VCSRecurrenceRule initWithString:](v11, "initWithString:", [v12 bytes]);

  if (!v10)
  {
    id v10 = [v8 keyword];
  }
  if ([v9 palmImport])
  {
    objc_super v14 = [(VCSRecurrenceRule *)v13 endDate];
    int v15 = v14;
    if (v14)
    {
      unsigned int v16 = [v14 dateForEndOfDay];
      [(VCSRecurrenceRule *)v13 setEndDate:v16];
    }
  }
  int v17 = [(VCSProperty *)self initWithName:v10 rawValue:v13 type:9];

  return v17;
}

- (id)initTranspProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7 = a3;
  id v8 = a5->var4;
  if (!v8)
  {
    id v8 = [v7 keyword];
  }
  id v9 = [v7 content];
  BOOL v10 = strcmp((const char *)[v9 bytes], "0") != 0;

  id v11 = [NSNumber numberWithUnsignedInteger:v10];
  id v12 = [(VCSProperty *)self initWithName:v8 rawValue:v11 type:1];

  return v12;
}

- (id)initKeywordListProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7 = a3;
  id v8 = a5->var4;
  id v9 = objc_opt_new();
  id v10 = [v7 content];
  id v11 = strdup((const char *)[v10 bytes]);

  if (!v8)
  {
    id v8 = [v7 keyword];
  }
  id v12 = 0;
  uint64_t v13 = v11;
  do
  {
    objc_super v14 = strchr(v13, 59);
    int v15 = v14;
    if (v14)
    {
      *objc_super v14 = 0;
      int v15 = v14 + 1;
    }
    unsigned int v16 = [MEMORY[0x1E4F28E78] stringWithUTF8String:v13];

    CFStringTrimWhitespace(v16);
    if ([(__CFString *)v16 length]) {
      [v9 addObject:v16];
    }
    uint64_t v13 = v15;
    id v12 = v16;
  }
  while (v15);
  free(v11);
  int v17 = [(VCSProperty *)self initWithName:v8 rawValues:v9 type:3];

  return v17;
}

- (id)initRFC822AddressProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5->var4;
  if (!v10)
  {
    id v10 = [v8 keyword];
  }
  id v11 = NSString;
  id v12 = [v8 content];
  uint64_t v13 = objc_msgSend(v11, "stringWithUTF8String:", objc_msgSend(v12, "bytes"));

  objc_super v14 = objc_msgSend(v13, "VCS_uncommentedAddress");
  if (v14)
  {
    int v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "VCS_URLForMail:", v14);
  }
  else
  {
    unsigned int v16 = VCSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[VCSProperty initRFC822AddressProperty:withParseState:property:](v8);
    }

    int v15 = 0;
  }
  int v17 = [(VCSProperty *)self initWithName:v10 rawValue:v15 type:8];

  return v17;
}

- (VCSPropertyValue)singleValue
{
  return (VCSPropertyValue *)[(NSMutableArray *)self->_values firstObject];
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)values
{
  return &self->_values->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithVCSLine:(void *)a1 parseState:.cold.1(void *a1)
{
  v1 = [a1 keyword];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB9BF000, v2, v3, "Unknown property: %@", v4, v5, v6, v7, v8);
}

- (void)initWithVCSLine:(void *)a1 parseState:.cold.2(void *a1)
{
  v1 = [a1 keyword];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB9BF000, v2, v3, "Property %@ is not in the right context.", v4, v5, v6, v7, v8);
}

- (void)initWithVCSLine:(os_log_t)log parseState:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB9BF000, log, OS_LOG_TYPE_ERROR, "ATTACH property has no VALUE param. iCal require an URL. No free form content.", v1, 2u);
}

- (void)initWithVCSLine:(os_log_t)log parseState:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB9BF000, log, OS_LOG_TYPE_ERROR, "ATTACH property has an unknown VALUE param.", v1, 2u);
}

- (void)initWithVCSLine:(void *)a1 parseState:.cold.5(void *a1)
{
  id v1 = [a1 content];
  [v1 bytes];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB9BF000, v2, v3, "Incorrect version for vCal file. Got '%s'", v4, v5, v6, v7, v8);
}

- (void)initWithVCSLine:(os_log_t)log parseState:.cold.6(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1DB9BF000, log, OS_LOG_TYPE_DEBUG, "Activating PalmDesktop hooks", v1, 2u);
}

- (void)initIntProperty:(uint64_t)a1 withParseState:(void *)a2 property:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 content];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = [v5 bytes];
  _os_log_error_impl(&dword_1DB9BF000, a3, OS_LOG_TYPE_ERROR, "Invalid property content for property '%@': '%s'", (uint8_t *)&v6, 0x16u);
}

- (void)initRFC822AddressProperty:(void *)a1 withParseState:property:.cold.1(void *a1)
{
  id v1 = [a1 content];
  [v1 bytes];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB9BF000, v2, v3, "'%s' does not contain an address.", v4, v5, v6, v7, v8);
}

@end