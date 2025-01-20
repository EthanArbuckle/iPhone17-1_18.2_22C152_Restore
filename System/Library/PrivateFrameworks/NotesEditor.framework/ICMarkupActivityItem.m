@interface ICMarkupActivityItem
- (ICAttachment)attachment;
- (ICMarkupActivityItem)initWithAttachment:(id)a3;
- (void)setAttachment:(id)a3;
@end

@implementation ICMarkupActivityItem

- (ICMarkupActivityItem)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICMarkupActivityItem;
  v5 = [(ICMarkupActivityItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICMarkupActivityItem *)v5 setAttachment:v4];
  }

  return v6;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end