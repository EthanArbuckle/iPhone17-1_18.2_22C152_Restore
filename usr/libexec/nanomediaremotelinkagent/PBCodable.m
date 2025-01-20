@interface PBCodable
- (id)nmr_valueForPotentiallyUndefinedKey:(id)a3;
@end

@implementation PBCodable

- (id)nmr_valueForPotentiallyUndefinedKey:(id)a3
{
  id v4 = a3;
  v5 = [v4 substringToIndex:1];
  v6 = [v5 uppercaseString];
  v7 = +[NSString stringWithFormat:@"has%@", v6];

  [v4 stringByReplacingCharactersInRange:0, 1, v7];
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027868;
  v15[3] = &unk_100045418;
  v15[4] = self;
  id v16 = v4;
  id v9 = v4;
  v10 = objc_retainBlock(v15);
  SEL v11 = NSSelectorFromString(v8);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v12 = (unsigned int (*)(PBCodable *, SEL))[(PBCodable *)self methodForSelector:v11]) != 0&& v12(self, v11))
  {
    v13 = ((void (*)(void *))v10[2])(v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end