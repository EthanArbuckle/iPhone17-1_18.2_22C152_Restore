@interface MNNavigationServiceCallbackParameters
+ (BOOL)supportsSecureCoding;
- (MNNavigationServiceCallbackParameters)initWithCoder:(id)a3;
- (unint64_t)type;
@end

@implementation MNNavigationServiceCallbackParameters

- (unint64_t)type
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: -[MNNavigationServiceCallbackParameters type] must be implemented by subclasses.", v3, 2u);
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNNavigationServiceCallbackParameters)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationServiceCallbackParameters;
  return [(MNNavigationServiceCallbackParameters *)&v4 init];
}

@end