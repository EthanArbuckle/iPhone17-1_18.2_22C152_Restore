@interface _UICollectionEstimatedSolutionBookmark
- (id)description;
@end

@implementation _UICollectionEstimatedSolutionBookmark

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryOffsets, 0);
  objc_storeStrong((id *)&self->_solution, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromRange(self->_itemRange);
  v7 = NSStringFromCGRect(self->_solutionFrame);
  v8 = [v3 stringWithFormat:@"<%@ %p: range=%@ frame=%@>", v5, self, v6, v7];;

  return v8;
}

@end