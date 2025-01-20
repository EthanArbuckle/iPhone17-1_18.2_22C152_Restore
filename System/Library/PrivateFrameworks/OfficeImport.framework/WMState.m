@interface WMState
- (BOOL)containsParagraph:(id)a3;
- (BOOL)isCurrentListDefinitionId:(int)a3;
- (BOOL)isCurrentListStateOverridden;
- (BOOL)isFrame;
- (BOOL)isFrameEnd;
- (BOOL)isFrameStart;
- (BOOL)isHeaderOrFooter;
- (NSMutableArray)paragraphStack;
- (WMState)init;
- (float)leftMargin;
- (float)pageHeight;
- (float)pageOffset;
- (float)topMargin;
- (float)totalPageHeight;
- (id)currentListState;
- (id)lastFooter;
- (id)lastHeader;
- (id)listStateForListDefinitionId:(int)a3;
- (id)listStateForListDefinitionWithId:(int)a3 settingUpStateIfNeededWithDocument:(id)a4;
- (id)outlineState;
- (unint64_t)blockIndex;
- (unint64_t)runIndex;
- (unsigned)currentPage;
- (void)clearCurrentListState;
- (void)dealloc;
- (void)popParagraph;
- (void)pushParagraph:(id)a3;
- (void)setBlockIndex:(unint64_t)a3;
- (void)setCurrentListState:(id)a3;
- (void)setCurrentPage:(unsigned int)a3;
- (void)setIsFrame:(BOOL)a3;
- (void)setIsFrameEnd:(BOOL)a3;
- (void)setIsFrameStart:(BOOL)a3;
- (void)setIsHeaderOrFooter:(BOOL)a3;
- (void)setLastFooter:(id)a3;
- (void)setLastHeader:(id)a3;
- (void)setLeftMargin:(float)a3;
- (void)setListState:(id)a3 forListDefinitionId:(int)a4;
- (void)setPageHeight:(float)a3;
- (void)setParagraphStack:(id)a3;
- (void)setRunIndex:(unint64_t)a3;
- (void)setTopMargin:(float)a3;
- (void)setTotalPageHeight:(float)a3;
@end

@implementation WMState

- (WMState)init
{
  v11.receiver = self;
  v11.super_class = (Class)WMState;
  v2 = [(CMState *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(CMOutlineState);
    outlineState = v2->outlineState;
    v2->outlineState = v3;

    v2->mCurrentPage = 0;
    v2->mPageHeight = 980.0;
    mLastHeader = v2->mLastHeader;
    v2->mLastHeader = 0;

    mLastFooter = v2->mLastFooter;
    v2->mLastFooter = 0;

    uint64_t v7 = objc_opt_new();
    paragraphStack = v2->_paragraphStack;
    v2->_paragraphStack = (NSMutableArray *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
}

- (void)setPageHeight:(float)a3
{
  self->mPageHeight = a3;
}

- (id)lastHeader
{
  return self->mLastHeader;
}

- (void)setBlockIndex:(unint64_t)a3
{
  self->mBlockIndex = a3;
}

- (void)setIsFrame:(BOOL)a3
{
  self->mIsFrame = a3;
}

- (void)setIsFrameStart:(BOOL)a3
{
  self->mIsFrameStart = a3;
}

- (void)setIsFrameEnd:(BOOL)a3
{
  self->mIsFrameEnd = a3;
}

- (BOOL)isFrame
{
  return self->mIsFrame;
}

- (void)setRunIndex:(unint64_t)a3
{
  self->mRunIndex = a3;
}

- (unsigned)currentPage
{
  return self->mCurrentPage;
}

- (void)setCurrentPage:(unsigned int)a3
{
  self->mCurrentPage = a3;
}

- (id)currentListState
{
  return self->currentListState;
}

- (BOOL)isCurrentListStateOverridden
{
  return self->currentListState != 0;
}

- (void)setCurrentListState:(id)a3
{
  v4 = (CMOutlineState *)a3;
  [(WMState *)self clearCurrentListState];
  currentListState = self->currentListState;
  self->currentListState = v4;
}

- (void)clearCurrentListState
{
  currentListState = self->currentListState;
  self->currentListState = 0;
}

- (id)lastFooter
{
  return self->mLastFooter;
}

- (void)dealloc
{
  [(WMState *)self clearCurrentListState];
  v3.receiver = self;
  v3.super_class = (Class)WMState;
  [(WMState *)&v3 dealloc];
}

- (void)setLastFooter:(id)a3
{
}

- (void)setIsHeaderOrFooter:(BOOL)a3
{
  self->mIsHeaderOrFooter = a3;
}

- (unint64_t)blockIndex
{
  return self->mBlockIndex;
}

- (BOOL)isFrameStart
{
  return self->mIsFrameStart;
}

- (BOOL)isFrameEnd
{
  return self->mIsFrameEnd;
}

- (void)setLastHeader:(id)a3
{
}

- (BOOL)isHeaderOrFooter
{
  return self->mIsHeaderOrFooter;
}

- (float)pageOffset
{
  unsigned int mCurrentPage = self->mCurrentPage;
  if (mCurrentPage) {
    return (double)mCurrentPage * self->mPageHeight;
  }
  else {
    return 0.0;
  }
}

- (float)totalPageHeight
{
  return self->mTotalPageHeight;
}

- (void)setTotalPageHeight:(float)a3
{
  self->mTotalPageHeight = a3;
}

- (id)outlineState
{
  return self->outlineState;
}

- (unint64_t)runIndex
{
  return self->mRunIndex;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (BOOL)isCurrentListDefinitionId:(int)a3
{
  if (![(WMState *)self isCurrentListStateOverridden]) {
    return 0;
  }
  v5 = [(WMState *)self currentListState];
  v6 = [v5 listDefinition];
  BOOL v7 = [v6 listDefinitionId] == a3;

  return v7;
}

- (id)listStateForListDefinitionId:(int)a3
{
  listStates = self->listStates;
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)listStates objectForKey:v4];

  return v5;
}

- (id)listStateForListDefinitionWithId:(int)a3 settingUpStateIfNeededWithDocument:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BOOL v7 = [(WMState *)self listStateForListDefinitionId:v4];
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = [v6 listDefinitionWithListDefinitionId:v4];
    v10 = [[CMOutlineState alloc] initWithListDefinition:v9];
    [(WMState *)self setListState:v10 forListDefinitionId:v4];
    v8 = v10;
  }
  return v8;
}

- (void)setListState:(id)a3 forListDefinitionId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  listStates = self->listStates;
  if (!listStates)
  {
    BOOL v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->listStates;
    self->listStates = v7;

    listStates = self->listStates;
  }
  v9 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)listStates setObject:v10 forKey:v9];
}

- (float)pageHeight
{
  return self->mPageHeight;
}

- (void)pushParagraph:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(WMState *)self paragraphStack];
  [v4 addObject:v5];
}

- (void)popParagraph
{
  id v2 = [(WMState *)self paragraphStack];
  [v2 removeLastObject];
}

- (BOOL)containsParagraph:(id)a3
{
  id v4 = a3;
  id v5 = [(WMState *)self paragraphStack];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSMutableArray)paragraphStack
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setParagraphStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraphStack, 0);
  objc_storeStrong((id *)&self->mLastFooter, 0);
  objc_storeStrong((id *)&self->mLastHeader, 0);
  objc_storeStrong((id *)&self->listStates, 0);
  objc_storeStrong((id *)&self->outlineState, 0);
  objc_storeStrong((id *)&self->currentListState, 0);
}

@end