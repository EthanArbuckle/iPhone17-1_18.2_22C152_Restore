@interface WFIntentResultUIAvailableResource
+ (BOOL)mustBeAvailableForDisplay;
- (BOOL)hasSuccessResponseWithDialog;
- (INIntentDescriptor)resolvedIntentDescriptor;
- (WFIntentResultUIAvailableResource)initWithDefinition:(id)a3;
- (WFIntentResultUIAvailableResource)initWithDefinition:(id)a3 resolvedIntentDescriptor:(id)a4 hasSuccessResponseWithDialog:(BOOL)a5;
- (void)refreshAvailability;
@end

@implementation WFIntentResultUIAvailableResource

- (void).cxx_destruct
{
}

- (BOOL)hasSuccessResponseWithDialog
{
  return self->_hasSuccessResponseWithDialog;
}

- (INIntentDescriptor)resolvedIntentDescriptor
{
  return self->_resolvedIntentDescriptor;
}

- (void)refreshAvailability
{
  if ([(WFIntentResultUIAvailableResource *)self hasSuccessResponseWithDialog])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [(WFIntentResultUIAvailableResource *)self resolvedIntentDescriptor];
    uint64_t v3 = [v4 hasCustomUIExtension];
  }
  [(WFResource *)self updateAvailability:v3 withError:0];
}

- (WFIntentResultUIAvailableResource)initWithDefinition:(id)a3 resolvedIntentDescriptor:(id)a4 hasSuccessResponseWithDialog:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFIntentResultUIAvailableResource;
  v10 = [(WFResource *)&v14 initWithDefinition:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resolvedIntentDescriptor, a4);
    v11->_hasSuccessResponseWithDialog = a5;
    v12 = v11;
  }

  return v11;
}

- (WFIntentResultUIAvailableResource)initWithDefinition:(id)a3
{
  return [(WFIntentResultUIAvailableResource *)self initWithDefinition:a3 resolvedIntentDescriptor:0 hasSuccessResponseWithDialog:0];
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end