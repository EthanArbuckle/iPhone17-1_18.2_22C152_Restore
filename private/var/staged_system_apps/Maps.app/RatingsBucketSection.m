@interface RatingsBucketSection
- (NSArray)objects;
- (NSAttributedString)title;
- (void)setObjects:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RatingsBucketSection

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end