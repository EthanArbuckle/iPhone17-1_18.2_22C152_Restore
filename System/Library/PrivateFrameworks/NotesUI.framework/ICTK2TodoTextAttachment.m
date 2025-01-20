@interface ICTK2TodoTextAttachment
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGSize)attachmentSizeForTextContainer:(id)a3;
- (ICTK2TodoTextAttachment)initWithTodo:(id)a3;
- (ICTTTodo)todo;
- (id)viewIdentifier;
@end

@implementation ICTK2TodoTextAttachment

- (ICTK2TodoTextAttachment)initWithTodo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F830A0];
  v10.receiver = self;
  v10.super_class = (Class)ICTK2TodoTextAttachment;
  v7 = [(ICTextAttachment *)&v10 initWithData:0 ofType:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_todo, a3);
  }

  return v8;
}

- (id)viewIdentifier
{
  v2 = [(ICTK2TodoTextAttachment *)self todo];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  +[ICTodoButton defaultSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y = a7.y;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat v9 = a6.origin.y;
  CGFloat x = a6.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)ICTK2TodoTextAttachment;
  -[ICTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v26, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v27.origin.CGFloat x = x;
  v27.origin.double y = v9;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v19 = CGRectGetHeight(v27);
  v28.origin.CGFloat x = v12;
  v28.origin.double y = v14;
  v28.size.CGFloat width = v16;
  v28.size.CGFloat height = v18;
  double v20 = CGRectGetHeight(v28);
  v29.origin.CGFloat x = v12;
  v29.origin.double y = v14;
  v29.size.CGFloat width = v16;
  v29.size.CGFloat height = v18;
  double v21 = -(v20 - v19 + y - CGRectGetMidY(v29));
  double v22 = v12;
  double v23 = v16;
  double v24 = v18;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.double y = v21;
  result.origin.CGFloat x = v22;
  return result;
}

- (ICTTTodo)todo
{
  return self->_todo;
}

- (void).cxx_destruct
{
}

@end