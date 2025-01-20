@interface RecentBucketSection
- (NSArray)objects;
- (NSString)title;
- (void)setObjects:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RecentBucketSection

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (NSString)title
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