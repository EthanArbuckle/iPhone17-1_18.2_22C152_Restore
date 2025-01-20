@interface TMLUIControlActionTarget
- (TMLUIControlActionTarget)initWithSignal:(id)a3 controlEvent:(unint64_t)a4;
- (void)controlAction:(id)a3 forEvent:(id)a4;
@end

@implementation TMLUIControlActionTarget

- (TMLUIControlActionTarget)initWithSignal:(id)a3 controlEvent:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TMLUIControlActionTarget;
  v8 = [(TMLUIControlActionTarget *)&v13 init];
  if (v8)
  {
    uint64_t v10 = objc_msgSend_copy(v6, v7, v9);
    signalName = v8->_signalName;
    v8->_signalName = (NSString *)v10;

    v8->_controlEvent = a4;
  }

  return v8;
}

- (void)controlAction:(id)a3 forEvent:(id)a4
{
  signalName = self->_signalName;
  unint64_t controlEvent = self->_controlEvent;
  id v16 = a3;
  if (controlEvent >= 0x1000)
  {
    objc_msgSend_emitTMLSignal_withArguments_(v16, v7, v8, signalName, 0);
    v15 = v16;
  }
  else
  {
    double v9 = objc_msgSend_allTouches(a4, v7, v8);
    v12 = objc_msgSend_allObjects(v9, v10, v11);
    objc_msgSend_emitTMLSignal_withArguments_(v16, v13, v14, signalName, v12);

    v15 = v9;
  }
}

- (void).cxx_destruct
{
}

@end