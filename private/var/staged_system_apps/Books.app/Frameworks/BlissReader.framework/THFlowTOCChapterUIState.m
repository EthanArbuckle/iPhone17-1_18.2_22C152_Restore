@interface THFlowTOCChapterUIState
- (BOOL)opened;
- (NSIndexPath)section;
- (NSMutableArray)subItems;
- (THFlowTOCChapterUIState)initWithSection:(id)a3;
- (void)dealloc;
- (void)setOpened:(BOOL)a3;
- (void)setSection:(id)a3;
- (void)setSubItems:(id)a3;
@end

@implementation THFlowTOCChapterUIState

- (THFlowTOCChapterUIState)initWithSection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCChapterUIState;
  v4 = [(THFlowTOCChapterUIState *)&v6 init];
  if (v4)
  {
    v4->mSection = (NSIndexPath *)a3;
    v4->mOpened = 0;
  }
  return v4;
}

- (void)dealloc
{
  self->mSection = 0;
  self->mSubItems = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCChapterUIState;
  [(THFlowTOCChapterUIState *)&v3 dealloc];
}

- (NSIndexPath)section
{
  return self->mSection;
}

- (void)setSection:(id)a3
{
}

- (BOOL)opened
{
  return self->mOpened;
}

- (void)setOpened:(BOOL)a3
{
  self->mOpened = a3;
}

- (NSMutableArray)subItems
{
  return self->mSubItems;
}

- (void)setSubItems:(id)a3
{
}

@end