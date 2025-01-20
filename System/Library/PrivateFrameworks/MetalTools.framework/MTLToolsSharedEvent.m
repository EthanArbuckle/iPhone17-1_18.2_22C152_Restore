@interface MTLToolsSharedEvent
- (BOOL)supportsRollback;
- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4;
- (IOSurfaceSharedEvent)IOSurfaceSharedEvent;
- (NSString)label;
- (id)newSharedEventHandle;
- (unint64_t)signaledValue;
- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5;
- (void)setLabel:(id)a3;
- (void)setSignaledValue:(unint64_t)a3;
@end

@implementation MTLToolsSharedEvent

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__MTLToolsSharedEvent_notifyListener_atValue_block___block_invoke;
  v10[3] = &unk_264E130D0;
  v10[4] = self;
  v10[5] = a5;
  [v9 notifyListener:a3 atValue:a4 block:v10];
}

uint64_t __52__MTLToolsSharedEvent_notifyListener_atValue_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)newSharedEventHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 newSharedEventHandle];
}

- (unint64_t)signaledValue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 signaledValue];
}

- (void)setSignaledValue:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setSignaledValue:a3];
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 waitUntilSignaledValue:a3 timeoutMS:a4];
}

- (IOSurfaceSharedEvent)IOSurfaceSharedEvent
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (IOSurfaceSharedEvent *)[v2 IOSurfaceSharedEvent];
}

- (BOOL)supportsRollback
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRollback];
}

@end