@interface DisplayClock
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
@end

@implementation DisplayClock

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v4 = sub_1B6E30AE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30AD8();
  v9 = *(void **)self->displayLink;
  swift_retain();
  if (v9)
  {
    unsigned __int8 v10 = objc_msgSend(v9, sel_isPaused);
    v11 = *(void **)self->displayLink;
  }
  else
  {
    v11 = 0;
    unsigned __int8 v10 = 1;
  }
  self->_pausedOnBackgrounding[0] = v10;
  objc_msgSend(v11, sel_setPaused_, 1);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v4 = sub_1B6E30AE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30AD8();
  if ((self->_pausedOnBackgrounding[0] & 1) == 0)
  {
    v9 = *(void **)self->displayLink;
    if (v9)
    {
      swift_retain();
      if (!objc_msgSend(v9, sel_isPaused))
      {
LABEL_7:
        swift_release();
        goto LABEL_8;
      }
      unsigned __int8 v10 = *(void **)self->displayLink;
    }
    else
    {
      swift_retain();
      unsigned __int8 v10 = 0;
    }
    objc_msgSend(v10, sel_setPaused_, 0);
    goto LABEL_7;
  }
LABEL_8:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

@end