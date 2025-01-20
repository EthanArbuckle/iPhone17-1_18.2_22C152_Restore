@interface MKTableTitleRow
- (MKTableTitleRow)initWithTitle:(id)a3;
- (id)asciiRepresentationUsingColumns:(id)a3;
- (id)csvRepresentation;
@end

@implementation MKTableTitleRow

- (MKTableTitleRow)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTableTitleRow;
  v6 = [(MKTableRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_title, a3);
  }

  return v7;
}

- (id)asciiRepresentationUsingColumns:(id)a3
{
  title = self->_title;
  uint64_t v4 = [(MKTableRow *)self totalWidthOfColumns:a3];
  return [(NSString *)title padToLength:v4 withString:@" "];
}

- (id)csvRepresentation
{
  return 0;
}

- (void).cxx_destruct
{
}

@end