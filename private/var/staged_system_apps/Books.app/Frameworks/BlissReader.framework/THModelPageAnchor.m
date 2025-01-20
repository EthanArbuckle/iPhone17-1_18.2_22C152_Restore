@interface THModelPageAnchor
- (THModelPageAnchor)initWithContentNode:(id)a3 relativePageIndex:(unint64_t)a4 presentationType:(id)a5;
- (THPresentationType)presentationType;
- (unint64_t)absolutePageIndex;
- (unint64_t)relativePageIndex;
- (void)dealloc;
- (void)setPresentationType:(id)a3;
- (void)setRelativePageIndex:(unint64_t)a3;
@end

@implementation THModelPageAnchor

- (THModelPageAnchor)initWithContentNode:(id)a3 relativePageIndex:(unint64_t)a4 presentationType:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THModelPageAnchor;
  v7 = [(THModelBoundAnchor *)&v10 initWithContentNode:a3];
  v8 = v7;
  if (v7)
  {
    [(THModelPageAnchor *)v7 setRelativePageIndex:a4];
    [(THModelPageAnchor *)v8 setPresentationType:a5];
  }
  return v8;
}

- (void)dealloc
{
  [(THModelPageAnchor *)self setPresentationType:0];
  v3.receiver = self;
  v3.super_class = (Class)THModelPageAnchor;
  [(THModelBoundAnchor *)&v3 dealloc];
}

- (unint64_t)absolutePageIndex
{
  if (!-[THPresentationType isPaginated](-[THModelPageAnchor presentationType](self, "presentationType"), "isPaginated"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:@"-[THModelPageAnchor absolutePageIndex]" file:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageAnchor.m" lineNumber:34 description:@"absolute page index will likely be wrong in a non-paginated presentation type"]; {
  objc_super v3 = [(THModelBoundAnchor *)self contentNode];
  }
  unint64_t v4 = [(THModelPageAnchor *)self relativePageIndex];
  v5 = [(THModelPageAnchor *)self presentationType];

  return [(THModelNode *)v3 absolutePageIndexForRelativePageIndex:v4 forPresentationType:v5];
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (void)setPresentationType:(id)a3
{
}

- (unint64_t)relativePageIndex
{
  return self->mRelativePageIndex;
}

- (void)setRelativePageIndex:(unint64_t)a3
{
  self->mRelativePageIndex = a3;
}

@end