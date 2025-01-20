@interface PanicPatternMatchingSupport
- (BOOL)lookForKnownPanic:(id)a3;
- (BOOL)takeAction;
- (id)createPanicCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (id)init:(BOOL)a3;
- (objcDiagnosticPatternMatching)patternMatching;
- (void)setPatternMatching:(id)a3;
- (void)setTakeAction:(BOOL)a3;
@end

@implementation PanicPatternMatchingSupport

- (void).cxx_destruct
{
}

- (void)setTakeAction:(BOOL)a3
{
  self->_takeAction = a3;
}

- (BOOL)takeAction
{
  return self->_takeAction;
}

- (void)setPatternMatching:(id)a3
{
}

- (objcDiagnosticPatternMatching)patternMatching
{
  return (objcDiagnosticPatternMatching *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)lookForKnownPanic:(id)a3
{
  id v4 = a3;
  v5 = [(PanicPatternMatchingSupport *)self patternMatching];

  if (v5)
  {
    v6 = [(PanicPatternMatchingSupport *)self patternMatching];
    v7 = [v4 getPanicCriterials];
    unsigned __int8 v8 = [v6 lookForPattern:v7 :0];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)createPanicCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (NSClassFromString(@"objcPanicCriterials")) {
    id v13 = [objc_alloc((Class)objcPanicCriterials) initWithCriterials:v9 :v10 :v11 :v12];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  if (!NSClassFromString(@"objcDiagnosticPatternMatching"))
  {
LABEL_10:
    id v12 = 0;
    goto LABEL_11;
  }
  [(PanicPatternMatchingSupport *)self setTakeAction:v3];
  id v5 = [objc_alloc((Class)objcDiagnosticPatternMatching) initWithType:2];
  [(PanicPatternMatchingSupport *)self setPatternMatching:v5];

  v6 = [(PanicPatternMatchingSupport *)self patternMatching];

  v7 = qword_10003A5D8;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to initialize Pattern Matching", (uint8_t *)&v14, 2u);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = v7;
    id v9 = [(PanicPatternMatchingSupport *)self patternMatching];
    unsigned int v10 = [v9 isPatternPayloadAvailable];
    id v11 = "No";
    if (v10) {
      id v11 = "Yes";
    }
    int v14 = 136315138;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Pattern Matching initialized with payload available: %s", (uint8_t *)&v14, 0xCu);
  }
  id v12 = self;
LABEL_11:

  return v12;
}

@end