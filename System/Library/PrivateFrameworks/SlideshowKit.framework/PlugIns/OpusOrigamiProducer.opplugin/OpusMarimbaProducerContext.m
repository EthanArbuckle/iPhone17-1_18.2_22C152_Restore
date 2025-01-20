@interface OpusMarimbaProducerContext
+ (void)initialize;
- (NSMutableArray)synopsisGroups;
- (OpusMarimbaProducerContext)init;
- (void)dealloc;
- (void)setSynopsisGroups:(id)a3;
@end

@implementation OpusMarimbaProducerContext

+ (void)initialize
{
  global_queue = dispatch_get_global_queue(25, 0);
  dispatch_async(global_queue, &stru_1AAEA8);
}

- (OpusMarimbaProducerContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)OpusMarimbaProducerContext;
  v2 = [(OpusMarimbaProducerContext *)&v4 init];
  if (v2) {
    v2->_synopsisGroups = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  synopsisGroups = self->_synopsisGroups;
  if (synopsisGroups)
  {

    self->_synopsisGroups = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OpusMarimbaProducerContext;
  [(OpusMarimbaProducerContext *)&v4 dealloc];
}

- (NSMutableArray)synopsisGroups
{
  return self->_synopsisGroups;
}

- (void)setSynopsisGroups:(id)a3
{
}

@end