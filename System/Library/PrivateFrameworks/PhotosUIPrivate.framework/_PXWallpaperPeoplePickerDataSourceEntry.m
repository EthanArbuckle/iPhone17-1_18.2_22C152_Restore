@interface _PXWallpaperPeoplePickerDataSourceEntry
- (NSArray)persons;
- (NSString)title;
- (void)setPersons:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _PXWallpaperPeoplePickerDataSourceEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_persons, 0);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setPersons:(id)a3
{
}

- (NSArray)persons
{
  return self->_persons;
}

@end