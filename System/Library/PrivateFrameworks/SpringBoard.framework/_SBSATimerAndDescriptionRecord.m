@interface _SBSATimerAndDescriptionRecord
- (BOOL)isTimerDescriptionElapsed;
- (SBSATimerDescription)timerDescription;
- (_SBSATimerAndDescriptionRecord)initWithTimerDescription:(id)a3;
- (void)schedule:(id)a3;
- (void)setTimerDescription:(id)a3;
@end

@implementation _SBSATimerAndDescriptionRecord

- (_SBSATimerAndDescriptionRecord)initWithTimerDescription:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SBSATimerAndDescriptionRecord;
  v5 = [(_SBSATimerAndDescriptionRecord *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(_SBSATimerAndDescriptionRecord *)v5 setTimerDescription:v4];
    id v7 = objc_alloc(MEMORY[0x1E4F4F6F0]);
    v8 = [v4 timerDescriptionIdentifier];
    v9 = [v8 UUIDString];
    uint64_t v10 = [v7 initWithIdentifier:v9];
    timer = v6->_timer;
    v6->_timer = (BSContinuousMachTimer *)v10;
  }
  return v6;
}

- (BOOL)isTimerDescriptionElapsed
{
  v3 = [(_SBSATimerAndDescriptionRecord *)self timerDescription];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  v5 = [(_SBSATimerAndDescriptionRecord *)self timerDescription];
  char v6 = [v5 isElapsed];

  return v6;
}

- (void)schedule:(id)a3
{
  id v4 = a3;
  if (![(_SBSATimerAndDescriptionRecord *)self isTimerDescriptionElapsed])
  {
    objc_initWeak(&location, self);
    timer = self->_timer;
    char v6 = [(_SBSATimerAndDescriptionRecord *)self timerDescription];
    [v6 timeInterval];
    double v8 = v7;
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43___SBSATimerAndDescriptionRecord_schedule___block_invoke;
    v11[3] = &unk_1E6B03370;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [(BSContinuousMachTimer *)timer scheduleWithFireInterval:v9 leewayInterval:v11 queue:v8 handler:0.0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (SBSATimerDescription)timerDescription
{
  return self->_timerDescription;
}

- (void)setTimerDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDescription, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end