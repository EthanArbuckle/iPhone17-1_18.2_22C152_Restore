@interface MOExampleNotifier
- (MOExampleNotifier)initWithName:(id)a3;
- (void)onEnable;
- (void)tick;
@end

@implementation MOExampleNotifier

- (MOExampleNotifier)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MOExampleNotifier;
  v3 = [(MONotifier *)&v7 initWithName:a3];
  v4 = (MOExampleNotifier *)v3;
  if (v3)
  {
    *(_DWORD *)(v3 + 33) = 0;
    v5 = v3;
  }

  return v4;
}

- (void)onEnable
{
  *(_DWORD *)(&self->super._enabled + 1) = 0;
  [(MOExampleNotifier *)self tick];
}

- (void)tick
{
  if ([(MONotifier *)self isEnabled])
  {
    v3 = +[NSNumber numberWithInt:*(unsigned int *)(&self->super._enabled + 1)];
    [(MONotifier *)self notify:0 withPayload:v3];

    HIDWORD(v4) = -286331153 * *(_DWORD *)(&self->super._enabled + 1) + 143165576;
    LODWORD(v4) = HIDWORD(v4);
    if ((v4 >> 2) <= 0x4444444)
    {
      v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [(MONotifier *)self notify:1 withPayload:v5];
    }
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    objc_super v7 = [(MONotifier *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __25__MOExampleNotifier_tick__block_invoke;
    block[3] = &unk_1002C98B8;
    block[4] = self;
    dispatch_after(v6, v7, block);
  }
}

id __25__MOExampleNotifier_tick__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tick];
}

@end