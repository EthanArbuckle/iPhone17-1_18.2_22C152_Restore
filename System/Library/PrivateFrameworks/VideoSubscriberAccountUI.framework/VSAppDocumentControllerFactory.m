@interface VSAppDocumentControllerFactory
+ (id)appDocumentControllerForAppDocument:(id)a3 error:(id *)a4;
@end

@implementation VSAppDocumentControllerFactory

+ (id)appDocumentControllerForAppDocument:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 templateElement];
  uint64_t v7 = objc_msgSend(v6, "vs_elementType");

  switch(v7)
  {
    case 161:
      v8 = VSCredentialEntryAppDocumentController;
      goto LABEL_11;
    case 162:
      v8 = VSAutoAuthenticationAppDocumentController;
      goto LABEL_11;
    case 163:
      v8 = VSWebAuthenticationAppDocumentController;
      goto LABEL_11;
    case 164:
      v8 = VSOnscreenCodeAuthenticationAppDocumentController;
      goto LABEL_11;
    case 165:
      v8 = VSTwoFactorEntryAppDocumentController;
LABEL_11:
      v11 = (void *)[[v8 alloc] initWithAppDocument:v5];
      v10 = 0;
      if (a4) {
        goto LABEL_12;
      }
      goto LABEL_13;
    default:
      v9 = VSErrorLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[VSAppDocumentControllerFactory appDocumentControllerForAppDocument:error:](v9);
      }

      v10 = VSPrivateError();
      v11 = 0;
      if (!a4) {
        goto LABEL_13;
      }
LABEL_12:
      *a4 = v10;
LABEL_13:

      return v11;
  }
}

+ (void)appDocumentControllerForAppDocument:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "VSAppDocumentControllerFactory: Unknown template element", v1, 2u);
}

@end