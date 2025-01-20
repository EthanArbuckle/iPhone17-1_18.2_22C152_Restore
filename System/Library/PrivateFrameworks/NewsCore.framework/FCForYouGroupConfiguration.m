@interface FCForYouGroupConfiguration
- (BOOL)allowsNativeAds;
- (NSString)identifier;
- (id)copyWithGroupPosition:(unint64_t)a3 precedingGroupsCount:(unint64_t)a4 precedingGroupsCountForFirstGroup:(unint64_t)a5;
- (int64_t)compareGroupPosition:(id)a3;
- (int64_t)groupType;
- (unint64_t)groupPosition;
- (unint64_t)precedingGroupsCount;
- (unint64_t)precedingGroupsCountForFirstGroup;
- (void)setAllowsNativeAds:(BOOL)a3;
- (void)setGroupPosition:(unint64_t)a3;
- (void)setGroupType:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrecedingGroupsCount:(unint64_t)a3;
- (void)setPrecedingGroupsCountForFirstGroup:(unint64_t)a3;
@end

@implementation FCForYouGroupConfiguration

- (void).cxx_destruct
{
}

- (void)setPrecedingGroupsCountForFirstGroup:(unint64_t)a3
{
  self->_precedingGroupsCountForFirstGroup = a3;
}

- (void)setPrecedingGroupsCount:(unint64_t)a3
{
  self->_precedingGroupsCount = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (void)setGroupPosition:(unint64_t)a3
{
  self->_groupPosition = a3;
}

- (void)setAllowsNativeAds:(BOOL)a3
{
  self->_allowsNativeAds = a3;
}

- (unint64_t)precedingGroupsCount
{
  return self->_precedingGroupsCount;
}

- (int64_t)compareGroupPosition:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[FCForYouGroupConfiguration groupPosition](self, "groupPosition"));
  v7 = NSNumber;
  uint64_t v8 = [v5 groupPosition];

  v9 = [v7 numberWithUnsignedInteger:v8];
  int64_t v10 = [v6 compare:v9];

  return v10;
}

- (id)copyWithGroupPosition:(unint64_t)a3 precedingGroupsCount:(unint64_t)a4 precedingGroupsCountForFirstGroup:(unint64_t)a5
{
  v9 = objc_alloc_init(FCForYouGroupConfiguration);
  int64_t v10 = [(FCForYouGroupConfiguration *)self identifier];
  [(FCForYouGroupConfiguration *)v9 setIdentifier:v10];

  [(FCForYouGroupConfiguration *)v9 setGroupType:[(FCForYouGroupConfiguration *)self groupType]];
  [(FCForYouGroupConfiguration *)v9 setGroupPosition:a3];
  [(FCForYouGroupConfiguration *)v9 setPrecedingGroupsCount:a4];
  [(FCForYouGroupConfiguration *)v9 setPrecedingGroupsCountForFirstGroup:a5];
  [(FCForYouGroupConfiguration *)v9 setAllowsNativeAds:[(FCForYouGroupConfiguration *)self allowsNativeAds]];
  return v9;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)allowsNativeAds
{
  return self->_allowsNativeAds;
}

- (unint64_t)groupPosition
{
  return self->_groupPosition;
}

- (unint64_t)precedingGroupsCountForFirstGroup
{
  return self->_precedingGroupsCountForFirstGroup;
}

@end