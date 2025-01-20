@interface SPCommandKeysCriteria
- (BOOL)_cl_isEqual:(id)a3;
- (id)description;
@end

@implementation SPCommandKeysCriteria

- (id)description
{
  return [NSString stringWithFormat:@"sequence: %d, index: %d, hint: %d, indices: %@", [self sequence], [self index], [self hint], [self indices]];
}

- (BOOL)_cl_isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [a3 dateInterval];
  id v6 = [(SPCommandKeysCriteria *)self dateInterval];
  if (v5) {
    unsigned int v7 = [v6 isEqualToDateInterval:[a3 dateInterval]];
  }
  else {
    unsigned int v7 = v6 == 0;
  }
  if ([a3 sequence])
  {
    if (v7) {
      unsigned int v7 = [[-[SPCommandKeysCriteria sequence](self, "sequence") isEqualToNumber:[a3 sequence]];
    }
  }
  else if (v7)
  {
    unsigned int v7 = [(SPCommandKeysCriteria *)self sequence] == 0;
  }
  if ([a3 index])
  {
    if (v7) {
      unsigned int v7 = [[-[SPCommandKeysCriteria index](self, "index") isEqualToNumber:[a3 index]];
    }
  }
  else if (v7)
  {
    unsigned int v7 = [(SPCommandKeysCriteria *)self index] == 0;
  }
  if ([a3 indices])
  {
    if (v7) {
      unsigned int v7 = [[-[SPCommandKeysCriteria indices](self, "indices") isEqualToArray:objc_msgSend(a3, "indices")];
    }
  }
  else if (v7)
  {
    unsigned int v7 = [(SPCommandKeysCriteria *)self indices] == 0;
  }
  if (![a3 hint])
  {
    if (v7) {
      return [(SPCommandKeysCriteria *)self hint] == 0;
    }
    return 0;
  }
  if (!v7) {
    return 0;
  }
  id v9 = [(SPCommandKeysCriteria *)self hint];
  id v10 = [a3 hint];

  return [v9 isEqualToNumber:v10];
}

@end