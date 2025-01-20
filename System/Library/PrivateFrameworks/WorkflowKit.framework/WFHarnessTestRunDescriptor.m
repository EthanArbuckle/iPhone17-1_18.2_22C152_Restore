@interface WFHarnessTestRunDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)holdingSecurityScopedAccess;
- (BOOL)shouldDisablePrivacyPrompts;
- (NSString)testIdentifier;
- (NSString)xcTestClass;
- (NSString)xcTestMethodName;
- (NSURL)testBundleURL;
- (WFHarnessTestCase)testCase;
- (WFHarnessTestRunDescriptor)initWithCoder:(id)a3;
- (WFHarnessTestRunDescriptor)initWithTestBundleURL:(id)a3 xcTestClass:(id)a4 xcTestMethodName:(id)a5 testIdentifier:(id)a6;
- (id)description;
- (id)loadTestCaseWithError:(id *)a3;
- (id)testMethodNamebyRemovingSuffixes:(id)a3;
- (void)createWorkflowWithEnvironment:(int64_t)a3 database:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setTestCase:(id)a3;
@end

@implementation WFHarnessTestRunDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCase, 0);
  objc_storeStrong((id *)&self->_testIdentifier, 0);
  objc_storeStrong((id *)&self->_xcTestMethodName, 0);
  objc_storeStrong((id *)&self->_xcTestClass, 0);
  objc_storeStrong((id *)&self->_testBundleURL, 0);
}

- (void)setTestCase:(id)a3
{
}

- (WFHarnessTestCase)testCase
{
  return self->_testCase;
}

- (BOOL)holdingSecurityScopedAccess
{
  return self->_holdingSecurityScopedAccess;
}

- (NSString)testIdentifier
{
  return self->_testIdentifier;
}

- (NSString)xcTestMethodName
{
  return self->_xcTestMethodName;
}

- (NSString)xcTestClass
{
  return self->_xcTestClass;
}

- (NSURL)testBundleURL
{
  return self->_testBundleURL;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: xcTestClass: %@, xcTestMethodName: %@, testIdentifier: %@, testCase != nil: %d, testBundleURL: %@"], v5, self, self->_xcTestClass, self->_xcTestMethodName, self->_testIdentifier, self->_testCase != 0, self->_testBundleURL);

  return v6;
}

- (BOOL)shouldDisablePrivacyPrompts
{
  v3 = [(WFHarnessTestRunDescriptor *)self testCase];

  if (!v3) {
    return 1;
  }
  v4 = [(WFHarnessTestRunDescriptor *)self testCase];
  v5 = [v4 interactions];
  char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_20357);

  return v6 ^ 1;
}

BOOL __57__WFHarnessTestRunDescriptor_shouldDisablePrivacyPrompts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 dialogRequestClass];
  return v2 == objc_opt_class();
}

- (id)loadTestCaseWithError:(id *)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  v5 = [(WFHarnessTestRunDescriptor *)self testCase];

  if (v5)
  {
    char v6 = [(WFHarnessTestRunDescriptor *)self testCase];
    goto LABEL_52;
  }
  v7 = (void *)MEMORY[0x1E4F28B50];
  v8 = [(WFHarnessTestRunDescriptor *)self testBundleURL];
  v9 = [v7 bundleWithURL:v8];

  if (!v9)
  {
    v32 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      v33 = [(WFHarnessTestRunDescriptor *)self testBundleURL];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v33;
      _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_FAULT, "%s Could not load test bundle at URL %@", buf, 0x16u);
    }
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
      char v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v6 = 0;
    }
    goto LABEL_51;
  }
  uint64_t v10 = [v9 sharedSupportURL];
  v73 = [(id)v10 URLByAppendingPathComponent:@"libActionHarnessTests.dylib"];

  LOBYTE(v10) = [(WFHarnessTestRunDescriptor *)v73 wf_fileExists];
  v11 = getWFTestHarnessLogObject();
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v34 = [(WFHarnessTestRunDescriptor *)self testBundleURL];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v34;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Could not find action harness test dylib in bundle %@", buf, 0x16u);
    }
    if (!a3) {
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    __int16 v90 = 2112;
    v91 = v73;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Loading test dylib at path %@", buf, 0x16u);
  }

  v13 = v73;
  if (!dlopen((const char *)[(WFHarnessTestRunDescriptor *)v13 fileSystemRepresentation], 2))
  {
    v35 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v13;
      _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_FAULT, "%s Could not dlopen test dylib at path %@", buf, 0x16u);
    }

    if (!a3) {
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  v14 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
  v15 = NSClassFromString(v14);

  if (!v15)
  {
    v39 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      v40 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v40;
      __int16 v92 = 2112;
      v93 = v13;
      _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_FAULT, "%s Could not find test class %@ inside dylib at path %@", buf, 0x20u);
    }
    if (!a3) {
      goto LABEL_49;
    }
LABEL_47:
    id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
    goto LABEL_48;
  }
  id v16 = objc_alloc_init(v15);
  v72 = v16;
  v17 = v16;
  if (!v16 || (char v18 = [v16 conformsToProtocol:&unk_1F239FF58], v17 = v72, (v18 & 1) == 0))
  {

    v36 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      v37 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v37;
      _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_FAULT, "%s Test class %@ does not conform to WFHarnessTestCaseVendor", buf, 0x16u);
    }
    if (a3)
    {
      id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
LABEL_48:
      char v6 = 0;
      *a3 = v38;
      goto LABEL_50;
    }
LABEL_49:
    char v6 = 0;
    goto LABEL_50;
  }
  [v72 setTestBundle:v9];
  unsigned int outCount = 0;
  v19 = class_copyMethodList(v15, &outCount);
  v20 = v19;
  if (!v19)
  {
    v45 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      v46 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v46;
      _os_log_impl(&dword_1C7F0A000, v45, OS_LOG_TYPE_FAULT, "%s Unable to get method list from test class: %@", buf, 0x16u);
    }
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      char v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v6 = 0;
    }
    goto LABEL_66;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v19;
  v70 = (void (**)(void))_Block_copy(aBlock);
  v21 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
    v23 = [(WFHarnessTestRunDescriptor *)self xcTestMethodName];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    __int16 v90 = 2112;
    v91 = self;
    __int16 v92 = 2112;
    v93 = v22;
    __int16 v94 = 2112;
    *(void *)v95 = v23;
    _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_DEFAULT, "%s %@: Looking for test method %@ %@", buf, 0x2Au);
  }
  v24 = [(WFHarnessTestRunDescriptor *)self xcTestMethodName];
  v71 = [(WFHarnessTestRunDescriptor *)self testMethodNamebyRemovingSuffixes:v24];

  if (!outCount)
  {
LABEL_57:
    v28 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      v43 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
      v44 = [(WFHarnessTestRunDescriptor *)self xcTestMethodName];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = v43;
      __int16 v92 = 2112;
      v93 = v44;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_FAULT, "%s Failed to find a test method name matching %@ %@ - check if XCTest calling convention has changed", buf, 0x20u);
    }
    goto LABEL_59;
  }
  unint64_t v25 = 0;
  char v68 = 0;
  while (1)
  {
    while (1)
    {
      v26 = v20[v25];
      Name = method_getName(v26);
      v28 = NSStringFromSelector(Name);
      if ([v28 hasPrefix:@"test"]) {
        break;
      }
LABEL_19:

      if (++v25 >= outCount)
      {
        if ((v68 & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
    }
    v29 = [(WFHarnessTestRunDescriptor *)self testMethodNamebyRemovingSuffixes:v28];
    if (([v29 isEqualToString:v71] & 1) == 0)
    {

      goto LABEL_19;
    }
    v69 = [NSString stringWithCString:method_getTypeEncoding(v26) encoding:4];
    if (v69)
    {
      if ([(WFHarnessTestRunDescriptor *)v69 length]) {
        break;
      }
    }
    v30 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = self;
      __int16 v92 = 2112;
      v93 = v31;
      __int16 v94 = 2112;
      *(void *)v95 = v28;
      _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_DEFAULT, "%s %@: Skipping considering %@ %@ - method has empty type encoding", buf, 0x2Au);
    }
    ++v25;
    char v68 = 1;
    if (v25 >= outCount) {
      goto LABEL_56;
    }
  }
  v47 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    __int16 v90 = 2112;
    v91 = self;
    __int16 v92 = 2112;
    v93 = v69;
    _os_log_impl(&dword_1C7F0A000, v47, OS_LOG_TYPE_DEFAULT, "%s %@: types=%@", buf, 0x20u);
  }

  id v67 = [(objc_class *)v15 instanceMethodSignatureForSelector:Name];
  uint64_t v48 = [v67 numberOfArguments];
  v49 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    __int16 v90 = 2112;
    v91 = self;
    __int16 v92 = 2048;
    v93 = (WFHarnessTestRunDescriptor *)v48;
    _os_log_impl(&dword_1C7F0A000, v49, OS_LOG_TYPE_DEFAULT, "%s %@: methodSignature.numberOfArguments=%lu", buf, 0x20u);
  }

  v50 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v67];
  [v50 setSelector:Name];
  [v50 setTarget:v72];
  v66 = v50;
  int v51 = [v28 containsString:@"WithCompletionHandler:"];
  if (v51)
  {
    if (v48 == 3)
    {
      int v52 = [(WFHarnessTestRunDescriptor *)v69 containsString:@"\"NSError\""];
      goto LABEL_79;
    }
LABEL_78:
    int v52 = 0;
  }
  else
  {
    if (v48 != 3) {
      goto LABEL_78;
    }
    v53 = (const char *)[v67 getArgumentTypeAtIndex:2];
    int v54 = strncmp(v53, "^@", 2uLL);
    int v52 = v54 == 0;
    v55 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = self;
      __int16 v92 = 2112;
      v93 = (WFHarnessTestRunDescriptor *)v28;
      __int16 v94 = 1024;
      *(_DWORD *)v95 = v54 == 0;
      *(_WORD *)&v95[4] = 2080;
      *(void *)&v95[6] = v53;
      *(_WORD *)&v95[14] = 2080;
      *(void *)&v95[16] = "^@";
      _os_log_impl(&dword_1C7F0A000, v55, OS_LOG_TYPE_DEFAULT, "%s %@: %@ isThrowingTest %d type=%s errorTestArgumentType=%s", buf, 0x3Au);
    }
  }
LABEL_79:
  v56 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    __int16 v90 = 2112;
    v91 = self;
    __int16 v92 = 2112;
    v93 = v57;
    __int16 v94 = 2112;
    *(void *)v95 = v28;
    *(_WORD *)&v95[8] = 1024;
    *(_DWORD *)&v95[10] = v51;
    *(_WORD *)&v95[14] = 1024;
    *(_DWORD *)&v95[16] = v52;
    _os_log_impl(&dword_1C7F0A000, v56, OS_LOG_TYPE_DEFAULT, "%s %@: Invoking test method %@ %@, isAsyncTest: %d, isThrowingTest: %d", buf, 0x36u);
  }
  if (!v51)
  {
    [v66 invoke];
    if (v52)
    {
      id v81 = 0;
      [v66 getArgument:&v81 atIndex:2];
      if (a3) {
        *a3 = v81;
      }
      if (v81)
      {
        v59 = getWFTestHarnessLogObject();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
          __int16 v90 = 2112;
          v91 = self;
          __int16 v92 = 2112;
          v93 = v60;
          __int16 v94 = 2112;
          *(void *)v95 = v28;
          *(_WORD *)&v95[8] = 2112;
          *(void *)&v95[10] = v81;
          _os_log_impl(&dword_1C7F0A000, v59, OS_LOG_TYPE_ERROR, "%s %@: Got error running test method %@ %@ - %@", buf, 0x34u);
        }
        goto LABEL_101;
      }
    }
    goto LABEL_103;
  }
  id v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__20382;
  v85 = __Block_byref_object_dispose__20383;
  id v86 = 0;
  dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
  if (v52)
  {
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_221;
    v77[3] = &unk_1E654FC58;
    v77[4] = self;
    v78 = v28;
    v80 = &v81;
    v79 = v58;
    *(void *)buf = _Block_copy(v77);
    [v66 setArgument:buf atIndex:2];
    [v66 invoke];
  }
  else
  {
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_223;
    v74[3] = &unk_1E65556E0;
    v74[4] = self;
    v75 = v28;
    v76 = v58;
    *(void *)buf = _Block_copy(v74);
    [v66 setArgument:buf atIndex:2];
    [v66 invoke];
  }
  dispatch_time_t v61 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v58, v61))
  {
    v62 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      __int16 v90 = 2112;
      v91 = self;
      __int16 v92 = 2112;
      v93 = v63;
      __int16 v94 = 2112;
      *(void *)v95 = v28;
      _os_log_impl(&dword_1C7F0A000, v62, OS_LOG_TYPE_DEFAULT, "%s %@: Timeout - giving up waiting on async test method %@ %@", buf, 0x2Au);
    }
    goto LABEL_100;
  }
  if (a3) {
    *a3 = v82[5];
  }
  if (!v82[5])
  {

    _Block_object_dispose(&v81, 8);
LABEL_103:

LABEL_56:
    v42 = [(WFHarnessTestRunDescriptor *)self testIdentifier];
    char v6 = [v72 testCaseWithIdentifier:v42];

    [(WFHarnessTestRunDescriptor *)self setTestCase:v6];
    goto LABEL_60;
  }
  v62 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v64 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
    id v65 = v82[5];
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    __int16 v90 = 2112;
    v91 = self;
    __int16 v92 = 2112;
    v93 = v64;
    __int16 v94 = 2112;
    *(void *)v95 = v28;
    *(_WORD *)&v95[8] = 2112;
    *(void *)&v95[10] = v65;
    _os_log_impl(&dword_1C7F0A000, v62, OS_LOG_TYPE_ERROR, "%s %@: Got error running async test method %@ %@ - %@", buf, 0x34u);
  }
LABEL_100:

  _Block_object_dispose(&v81, 8);
LABEL_101:

LABEL_59:
  char v6 = 0;
LABEL_60:

  v70[2]();
LABEL_66:

LABEL_50:
LABEL_51:

LABEL_52:
  return v6;
}

void __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke(uint64_t a1)
{
}

void __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = *(void **)(a1 + 32);
    v7 = [v6 xcTestClass];
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 136316162;
    uint64_t v10 = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]_block_invoke";
    __int16 v11 = 2112;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s %@: Async test method completed %@ %@ ; error %@",
      (uint8_t *)&v9,
      0x34u);
  }
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_223(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [v3 xcTestClass];
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315906;
    uint64_t v8 = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEFAULT, "%s %@: Test method completed %@ %@", (uint8_t *)&v7, 0x2Au);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)testMethodNamebyRemovingSuffixes:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"AndReturnError:"])
  {
    uint64_t v4 = [v3 substringToIndex:objc_msgSend(v3, "length") - objc_msgSend(@"AndReturnError:", "length")];

    id v3 = (id)v4;
  }
  if ([v3 hasSuffix:@"WithCompletionHandler:"])
  {
    uint64_t v5 = [v3 substringToIndex:objc_msgSend(v3, "length") - objc_msgSend(@"WithCompletionHandler:", "length")];

    id v3 = (id)v5;
  }
  if ([v3 hasSuffix:@"()"])
  {
    uint64_t v6 = [v3 substringToIndex:objc_msgSend(v3, "length") - objc_msgSend(@"()", "length")];

    id v3 = (id)v6;
  }
  return v3;
}

- (WFHarnessTestRunDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testBundleURL"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xcTestClass"];
  int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xcTestMethodName"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testIdentifier"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0 || v8 == 0)
  {
    __int16 v13 = 0;
  }
  else
  {
    v12 = [v5 url];
    self = [(WFHarnessTestRunDescriptor *)self initWithTestBundleURL:v12 xcTestClass:v6 xcTestMethodName:v7 testIdentifier:v8];

    __int16 v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28FF8];
  id v5 = a3;
  id v6 = [v4 alloc];
  int v7 = [(WFHarnessTestRunDescriptor *)self testBundleURL];
  id v11 = (id)[v6 initWithURL:v7];

  [v5 encodeObject:v11 forKey:@"testBundleURL"];
  uint64_t v8 = [(WFHarnessTestRunDescriptor *)self xcTestClass];
  [v5 encodeObject:v8 forKey:@"xcTestClass"];

  BOOL v9 = [(WFHarnessTestRunDescriptor *)self xcTestMethodName];
  [v5 encodeObject:v9 forKey:@"xcTestMethodName"];

  uint64_t v10 = [(WFHarnessTestRunDescriptor *)self testIdentifier];
  [v5 encodeObject:v10 forKey:@"testIdentifier"];
}

- (void)dealloc
{
  if ([(WFHarnessTestRunDescriptor *)self holdingSecurityScopedAccess])
  {
    id v3 = [(WFHarnessTestRunDescriptor *)self testBundleURL];
    [v3 stopAccessingSecurityScopedResource];
  }
  v4.receiver = self;
  v4.super_class = (Class)WFHarnessTestRunDescriptor;
  [(WFHarnessTestRunDescriptor *)&v4 dealloc];
}

- (WFHarnessTestRunDescriptor)initWithTestBundleURL:(id)a3 xcTestClass:(id)a4 xcTestMethodName:(id)a5 testIdentifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFHarnessTestRunDescriptor.m", 34, @"Invalid parameter not satisfying: %@", @"testBundleURL" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_14:
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, self, @"WFHarnessTestRunDescriptor.m", 36, @"Invalid parameter not satisfying: %@", @"xcTestMethodName" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFHarnessTestRunDescriptor.m", 35, @"Invalid parameter not satisfying: %@", @"xcTestClass" object file lineNumber description];

  if (!v14) {
    goto LABEL_14;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_15:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"WFHarnessTestRunDescriptor.m", 37, @"Invalid parameter not satisfying: %@", @"testIdentifier" object file lineNumber description];

LABEL_5:
  v32.receiver = self;
  v32.super_class = (Class)WFHarnessTestRunDescriptor;
  uint64_t v16 = [(WFHarnessTestRunDescriptor *)&v32 init];
  __int16 v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_testBundleURL, a3);
    uint64_t v18 = [v13 copy];
    xcTestClass = v17->_xcTestClass;
    v17->_xcTestClass = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    xcTestMethodName = v17->_xcTestMethodName;
    v17->_xcTestMethodName = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    testIdentifier = v17->_testIdentifier;
    v17->_testIdentifier = (NSString *)v22;

    int v24 = [v12 startAccessingSecurityScopedResource];
    v17->_holdingSecurityScopedAccess = v24;
    if (v24)
    {
      unint64_t v25 = getWFTestHarnessLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFHarnessTestRunDescriptor initWithTestBundleURL:xcTestClass:xcTestMethodName:testIdentifier:]";
        __int16 v35 = 2112;
        id v36 = v12;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_DEFAULT, "%s Taken sandbox extension to %@", buf, 0x16u);
      }
    }
    v26 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)createWorkflowWithEnvironment:(int64_t)a3 database:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = getWFTestHarnessLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[WFHarnessTestRunDescriptor(Conversion) createWorkflowWithEnvironment:database:completionHandler:]";
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ - Loading testCase", buf, 0x16u);
  }

  id v19 = 0;
  id v11 = [(WFHarnessTestRunDescriptor *)self loadTestCaseWithError:&v19];
  id v12 = v19;
  if (v11)
  {
    id v13 = [v11 runDescriptor];
    id v14 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v11 name];
      *(_DWORD *)buf = 136315906;
      v21 = "-[WFHarnessTestRunDescriptor(Conversion) createWorkflowWithEnvironment:database:completionHandler:]";
      __int16 v22 = 2112;
      v23 = self;
      __int16 v24 = 2112;
      unint64_t v25 = v13;
      __int16 v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ - Running workflow %@ %@", buf, 0x2Au);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__WFHarnessTestRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke;
    v16[3] = &unk_1E654FCA0;
    id v17 = v11;
    id v18 = v9;
    [v13 createWorkflowWithEnvironment:a3 database:v8 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v12);
  }
}

void __99__WFHarnessTestRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  int v7 = [v5 name];
  [v8 setName:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end