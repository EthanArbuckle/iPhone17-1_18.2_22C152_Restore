@interface ICSharedTracklistPosition
+ (id)playLastPositionWithAfterItemIdentifierHint:(id)a3;
+ (id)playNextPositionWithAfterItemIdentifierHint:(id)a3;
+ (id)specifiedPositionAfterItemIdentifier:(id)a3;
- (NSString)afterItemIdentifier;
- (int64_t)type;
@end

@implementation ICSharedTracklistPosition

- (void).cxx_destruct
{
}

- (NSString)afterItemIdentifier
{
  return self->_afterItemIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

+ (id)playLastPositionWithAfterItemIdentifierHint:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ICSharedTracklistPosition);
  v4->_type = 2;
  uint64_t v5 = [v3 copy];

  afterItemIdentifier = v4->_afterItemIdentifier;
  v4->_afterItemIdentifier = (NSString *)v5;

  return v4;
}

+ (id)playNextPositionWithAfterItemIdentifierHint:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ICSharedTracklistPosition);
  v4->_type = 1;
  uint64_t v5 = [v3 copy];

  afterItemIdentifier = v4->_afterItemIdentifier;
  v4->_afterItemIdentifier = (NSString *)v5;

  return v4;
}

+ (id)specifiedPositionAfterItemIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ICSharedTracklistPosition);
  v4->_type = 0;
  uint64_t v5 = [v3 copy];

  afterItemIdentifier = v4->_afterItemIdentifier;
  v4->_afterItemIdentifier = (NSString *)v5;

  return v4;
}

@end