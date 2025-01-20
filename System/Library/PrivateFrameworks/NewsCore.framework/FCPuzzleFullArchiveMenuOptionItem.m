@interface FCPuzzleFullArchiveMenuOptionItem
- (FCPuzzleFullArchiveMenuOptionItem)initWithTitle:(id)a3 icon:(id)a4 level:(unint64_t)a5 difficultyIndex:(int64_t)a6;
- (NSString)icon;
- (NSString)title;
- (int64_t)difficultyIndex;
- (unint64_t)level;
@end

@implementation FCPuzzleFullArchiveMenuOptionItem

- (FCPuzzleFullArchiveMenuOptionItem)initWithTitle:(id)a3 icon:(id)a4 level:(unint64_t)a5 difficultyIndex:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCPuzzleFullArchiveMenuOptionItem;
  v13 = [(FCPuzzleFullArchiveMenuOptionItem *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_title, a3);
    objc_storeStrong((id *)&v14->_icon, a4);
    v14->_level = a5;
    v14->_difficultyIndex = a6;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)icon
{
  return self->_icon;
}

- (unint64_t)level
{
  return self->_level;
}

- (int64_t)difficultyIndex
{
  return self->_difficultyIndex;
}

@end