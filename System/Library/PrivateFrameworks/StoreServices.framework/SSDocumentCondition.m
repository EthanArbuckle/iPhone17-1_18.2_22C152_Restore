@interface SSDocumentCondition
- (BOOL)evaluateWithContext:(id)a3;
@end

@implementation SSDocumentCondition

- (BOOL)evaluateWithContext:(id)a3
{
  if (evaluateWithContext__sOnce != -1) {
    dispatch_once(&evaluateWithContext__sOnce, &__block_literal_global_11);
  }
  if (evaluateWithContext__sMobileCoreServices) {
    return (objc_msgSend((id)objc_msgSend((id)-[objc_class documentProxyForName:type:MIMEType:](NSClassFromString(&cfstr_Lsdocumentprox.isa), "documentProxyForName:type:MIMEType:", 0, self->super._value, 0), "applicationsAvailableForOpeningWithError:", 0), "count") != 0) ^ (self->super._operator == 1);
  }
  else {
    return 0;
  }
}

void *__43__SSDocumentCondition_evaluateWithContext___block_invoke()
{
  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  evaluateWithContext__sMobileCoreServices = (uint64_t)result;
  return result;
}

@end