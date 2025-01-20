@interface SBFTapToWakeGestureRecognizer
- (BOOL)_isTapEvent:(__IOHIDEvent *)a3;
- (void)_succesfullyRecognizeFromEvent:(__IOHIDEvent *)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SBFTapToWakeGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a4, "_hidEvent", a3);
  BOOL v6 = [(SBFTapToWakeGestureRecognizer *)self _isTapEvent:v5];
  v7 = SBLogScreenWake();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = _SBFLoggingMethodProem(self, 1);
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 1024;
    BOOL v12 = v6;
    _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: isTapEvent=%{BOOL}u", (uint8_t *)&v9, 0x12u);
  }
  if (v6) {
    [(SBFTapToWakeGestureRecognizer *)self _succesfullyRecognizeFromEvent:v5];
  }
}

- (void)_succesfullyRecognizeFromEvent:(__IOHIDEvent *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = +[SBWakeLogger sharedInstance];
  [v4 wakeMayBegin:1 withTimestamp:IOHIDEventGetTimeStamp()];

  uint64_t v5 = [(SBFTapToWakeGestureRecognizer *)self state];
  BOOL v6 = SBLogScreenWake();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = _SBFLoggingMethodProem(self, 1);
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: state=%ld", (uint8_t *)&v8, 0x16u);
  }
  if (!v5) {
    [(SBFTapToWakeGestureRecognizer *)self setState:3];
  }
}

- (BOOL)_isTapEvent:(__IOHIDEvent *)a3
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  BKSHIDEventMatchingPredicate();
  char v3 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);
  return v3;
}

BOOL __45__SBFTapToWakeGestureRecognizer__isTapEvent___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (IOHIDEventGetType() != 11) {
    return 0;
  }
  if ((~IOHIDEventGetIntegerValue() & 0x20002) == 0)
  {
    if (a3) {
      uint64_t v5 = a1[5];
    }
    else {
      uint64_t v5 = a1[4];
    }
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
  }
  char v7 = *(unsigned char *)(*(void *)(a1[4] + 8) + 24);
  if (v7) {
    char v7 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24) != 0;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7;
  return *(unsigned char *)(*(void *)(a1[6] + 8) + 24) != 0;
}

@end