@interface AllRefinementsViewModelSectionOpenOption
- (AllRefinementsViewModelOpenAt)openAt;
- (AllRefinementsViewModelSectionOpenOption)initWithOpenNow:(id)a3 openAt:(id)a4 displayName:(id)a5;
- (AllRefinementsViewModelToggle)openNow;
- (BOOL)compare:(id)a3;
- (NSString)displayName;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfItems;
- (unint64_t)type;
- (void)resetToDefault;
- (void)setType:(unint64_t)a3;
@end

@implementation AllRefinementsViewModelSectionOpenOption

- (AllRefinementsViewModelSectionOpenOption)initWithOpenNow:(id)a3 openAt:(id)a4 displayName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AllRefinementsViewModelSectionOpenOption;
  v12 = [(AllRefinementsViewModelSectionOpenOption *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_openNow, a3);
    objc_storeStrong((id *)&v13->_openAt, a4);
    v14 = (NSString *)[v11 copy];
    displayName = v13->_displayName;
    v13->_displayName = v14;

    v13->_type = 2;
    v16 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    identifier = v13->_identifier;
    v13->_identifier = v16;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AllRefinementsViewModelSectionOpenOption alloc];
  id v5 = [(AllRefinementsViewModelToggle *)self->_openNow copy];
  id v6 = [(AllRefinementsViewModelOpenAt *)self->_openAt copy];
  id v7 = [(NSString *)self->_displayName copy];
  v8 = [(AllRefinementsViewModelSectionOpenOption *)v4 initWithOpenNow:v5 openAt:v6 displayName:v7];

  return v8;
}

- (unint64_t)numberOfItems
{
  openAt = self->_openAt;
  BOOL v3 = openAt == 0;
  unint64_t v4 = openAt != 0;
  unint64_t v5 = 1;
  if (!v3) {
    unint64_t v5 = 2;
  }
  if (self->_openNow) {
    return v5;
  }
  else {
    return v4;
  }
}

- (void)resetToDefault
{
  [(AllRefinementsViewModelToggle *)self->_openNow setIsSelected:0];
  openAt = self->_openAt;

  [(AllRefinementsViewModelOpenAt *)openAt updateTimeStamp:0 isSelected:0.0];
}

- (BOOL)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 openNow];
  unsigned int v6 = [v5 isSelected];
  if (v6 == [(AllRefinementsViewModelToggle *)self->_openNow isSelected])
  {
    v8 = [v4 openAt];
    unsigned int v9 = [v8 isSelected];
    if (v9 == [(AllRefinementsViewModelOpenAt *)self->_openAt isSelected])
    {
      id v10 = [v4 openAt];
      [v10 timeStamp];
      double v12 = v11;
      [(AllRefinementsViewModelOpenAt *)self->_openAt timeStamp];
      BOOL v7 = v12 == v13;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (AllRefinementsViewModelToggle)openNow
{
  return self->_openNow;
}

- (AllRefinementsViewModelOpenAt)openAt
{
  return self->_openAt;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_openAt, 0);

  objc_storeStrong((id *)&self->_openNow, 0);
}

@end