@interface RPTInteractionOptions
+ (RPTInteractionOptions)defaultForPlatform;
- (BOOL)prefersPointer;
- (RCPEventSenderProperties)senderProperties;
- (RPTInteractionOptions)init;
- (id)description;
- (int64_t)pointerFrequency;
- (unint64_t)preferredIdiom;
- (void)setPointerFrequency:(int64_t)a3;
- (void)setPreferredIdiom:(unint64_t)a3;
@end

@implementation RPTInteractionOptions

- (RCPEventSenderProperties)senderProperties
{
  v2 = [(RPTInteractionOptions *)self preferredIdiom];
  if (v2 == (void *)2)
  {
    v2 = [getRCPEventSenderPropertiesClass() mouseSender];
  }
  else if (v2 == (void *)1)
  {
    v2 = [getRCPEventSenderPropertiesClass() trackpadSender];
  }
  else if (!v2)
  {
    v2 = [getRCPEventSenderPropertiesClass() touchScreenDigitizerSender];
  }
  return (RCPEventSenderProperties *)v2;
}

+ (RPTInteractionOptions)defaultForPlatform
{
  if (defaultForPlatform_onceToken != -1) {
    dispatch_once(&defaultForPlatform_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)defaultForPlatform_defaultForPlatform;
  return (RPTInteractionOptions *)v2;
}

- (unint64_t)preferredIdiom
{
  return self->_preferredIdiom;
}

- (void)setPreferredIdiom:(unint64_t)a3
{
  self->_preferredIdiom = a3;
}

- (RPTInteractionOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)RPTInteractionOptions;
  result = [(RPTInteractionOptions *)&v3 init];
  if (result) {
    result->_pointerFrequency = 120;
  }
  return result;
}

uint64_t __43__RPTInteractionOptions_defaultForPlatform__block_invoke()
{
  v0 = objc_alloc_init(RPTInteractionOptions);
  v1 = (void *)defaultForPlatform_defaultForPlatform;
  defaultForPlatform_defaultForPlatform = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F28F80] processInfo];
  unsigned int v3 = [v2 isiOSAppOnMac];

  v4 = (void *)defaultForPlatform_defaultForPlatform;
  return [v4 setPreferredIdiom:v3];
}

- (BOOL)prefersPointer
{
  return self->_preferredIdiom != 0;
}

- (id)description
{
  unsigned int v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(RPTInteractionOptions *)self preferredIdiom];
  v7 = [(RPTInteractionOptions *)self senderProperties];
  v8 = [v3 stringWithFormat:@"<%@:%p preferredIdiom: %lu; senderProperties: %@>", v5, self, v6, v7];

  return v8;
}

- (int64_t)pointerFrequency
{
  return self->_pointerFrequency;
}

- (void)setPointerFrequency:(int64_t)a3
{
  self->_pointerFrequency = a3;
}

@end