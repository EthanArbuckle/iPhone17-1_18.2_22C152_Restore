@interface UIForceStageObservable
- (void)receiveObservedValue:(id)a3;
@end

@implementation UIForceStageObservable

- (void)receiveObservedValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__UIForceStageObservable_receiveObservedValue___block_invoke;
    v9[3] = &unk_1E5301DD8;
    id v10 = v4;
    v6 = +[_UIForceMessage observe:v9];
    v8.receiver = self;
    v8.super_class = (Class)UIForceStageObservable;
    [(UIForceStageObservable *)&v8 receiveObservedValue:v6];

    v7 = v10;
  }
  else
  {
    v7 = +[_UIForceMessage reset];
    v11.receiver = self;
    v11.super_class = (Class)UIForceStageObservable;
    [(UIForceStageObservable *)&v11 receiveObservedValue:v7];
  }
}

void __47__UIForceStageObservable_receiveObservedValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  IOHIDEventGetFloatValue();
  objc_msgSend(v3, "setTouchForce:");
  [v3 setStage:IOHIDEventGetIntegerValue()];
  unint64_t TimeStamp = IOHIDEventGetTimeStamp();
  [v3 setTimestamp:_UIMediaTimeForMachTime(TimeStamp)];
}

@end