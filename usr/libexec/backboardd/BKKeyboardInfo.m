@interface BKKeyboardInfo
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
@end

@implementation BKKeyboardInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualDeviceID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_keyboardActivationEventDescriptor, 0);
  objc_storeStrong((id *)&self->_eventRecognizer, 0);
  objc_storeStrong((id *)&self->_exclusivityIdentifier, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000813EC;
  v5[3] = &unk_1000F8E50;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:self block:v5];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (void)dealloc
{
  if (self->_gsKeyboard) {
    GSKeyboardRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)BKKeyboardInfo;
  [(BKKeyboardInfo *)&v3 dealloc];
}

@end