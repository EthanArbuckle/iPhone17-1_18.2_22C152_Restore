@interface WFRemoteQuarantineDecision
+ (id)JSONKeyPathsByPropertyKey;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (unint64_t)policy;
@end

@implementation WFRemoteQuarantineDecision

+ (id)JSONKeyPathsByPropertyKey
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"policy";
  v4[1] = @"errorTitle";
  v5[0] = @"policy";
  v5[1] = @"errorTitle";
  v4[2] = @"errorMessage";
  v5[2] = @"errorMessage";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (unint64_t)policy
{
  return self->_policy;
}

@end