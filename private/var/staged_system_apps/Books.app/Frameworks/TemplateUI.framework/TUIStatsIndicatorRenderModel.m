@interface TUIStatsIndicatorRenderModel
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSString)uid;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIStatsFeed)stats;
- (TUIStatsIndicatorRenderModel)initWithStats:(id)a3 uid:(id)a4;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIStatsIndicatorRenderModel

- (TUIStatsIndicatorRenderModel)initWithStats:(id)a3 uid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIStatsIndicatorRenderModel;
  v9 = [(TUIStatsIndicatorRenderModel *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stats, a3);
    v11 = (NSString *)[v8 copy];
    uid = v10->_uid;
    v10->_uid = v11;
  }
  return v10;
}

- (unint64_t)kind
{
  return 4;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  return a3 == self;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIStatsFeed)stats
{
  return self->_stats;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end