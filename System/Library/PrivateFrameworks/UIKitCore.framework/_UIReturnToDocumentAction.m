@interface _UIReturnToDocumentAction
+ (BOOL)_hasReturnToSenderFeature;
+ (id)actionWithFileURL:(id)a3;
@end

@implementation _UIReturnToDocumentAction

+ (BOOL)_hasReturnToSenderFeature
{
  if (qword_1EB2634C8 != -1) {
    dispatch_once(&qword_1EB2634C8, &__block_literal_global_522);
  }
  return _MergedGlobals_1240;
}

+ (id)actionWithFileURL:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke;
  v9[3] = &unk_1E53087E0;
  id v10 = v4;
  id v11 = a1;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____UIReturnToDocumentAction;
  id v5 = v4;
  v6 = objc_msgSendSuper2(&v8, sel_elementWithProvider_, v9);

  return v6;
}

@end