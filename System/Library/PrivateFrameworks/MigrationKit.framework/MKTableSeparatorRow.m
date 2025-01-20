@interface MKTableSeparatorRow
- (id)asciiRepresentationUsingColumns:(id)a3;
- (id)csvRepresentation;
@end

@implementation MKTableSeparatorRow

- (id)asciiRepresentationUsingColumns:(id)a3
{
  uint64_t v3 = [(MKTableRow *)self totalWidthOfColumns:a3];
  return (id)[&stru_26DF6A8B0 stringByPaddingToLength:v3 withString:@"-" startingAtIndex:0];
}

- (id)csvRepresentation
{
  return 0;
}

@end