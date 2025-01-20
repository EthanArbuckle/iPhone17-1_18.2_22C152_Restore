@interface _BKKeyboardEventExtras
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copy;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _BKKeyboardEventExtras

- (void).cxx_destruct
{
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [v8 appendObject:self->_authenticationSpecification withName:@"authSpec" skipIfNil:1];
  v5 = NSStringFromBKSHIDEventSource();
  [v8 appendString:v5 withName:@"eventSource"];

  id v6 = [v8 appendBool:self->_modifiersOnly withName:@"modifiersOnly"];
  id v7 = [v8 appendUnsignedInteger:self->_GSModifierState withName:@"GSModifierState" format:1];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (id)copy
{
  v3 = objc_alloc_init(_BKKeyboardEventExtras);
  objc_storeStrong((id *)&v3->_authenticationSpecification, self->_authenticationSpecification);
  v3->_eventSource = self->_eventSource;
  v3->_modifiersOnly = self->_modifiersOnly;
  v3->_GSModifierState = self->_GSModifierState;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_BKKeyboardEventExtras *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && BSEqualObjects()
      && self->_eventSource == v4->_eventSource
      && self->_modifiersOnly == v4->_modifiersOnly
      && self->_GSModifierState == v4->_GSModifierState;
  }

  return v5;
}

@end