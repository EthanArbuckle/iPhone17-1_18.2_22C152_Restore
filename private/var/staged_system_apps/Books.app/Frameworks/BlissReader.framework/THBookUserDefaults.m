@interface THBookUserDefaults
- (BOOL)BOOLForKey:(id)a3;
- (THBookUserDefaults)initWithBookID:(id)a3;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)p_modifyBookDefaultsDictionary:(id)a3;
- (void)p_readBookDefaultsDictionary:(id)a3;
- (void)registerDefaults:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation THBookUserDefaults

- (THBookUserDefaults)initWithBookID:(id)a3
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookUserDefaults initWithBookID:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"] lineNumber:26 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "bookID"];
  }
  v8.receiver = self;
  v8.super_class = (Class)THBookUserDefaults;
  v5 = [(THBookUserDefaults *)&v8 init];
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v5->_bookID = (NSString *)[a3 copy];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THBookUserDefaults;
  [(THBookUserDefaults *)&v3 dealloc];
}

- (id)objectForKey:(id)a3
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookUserDefaults objectForKey:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"] lineNumber:53 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"defaultName"];
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_1D4D88;
  v12 = sub_1D4D98;
  uint64_t v13 = 0;
  if (a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1D4DA4;
    v7[3] = &unk_45B0E8;
    v7[4] = a3;
    v7[5] = &v8;
    [(THBookUserDefaults *)self p_readBookDefaultsDictionary:v7];
    v5 = (void *)v9[5];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1D4F34;
      v5[3] = &unk_45B110;
      v5[4] = a3;
      v5[5] = a4;
      [(THBookUserDefaults *)self p_modifyBookDefaultsDictionary:v5];
      return;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults setObject:forKey:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m") lineNumber:69 description:@"invalid nil value for '%s'", "value"];
    if (a4) {
      return;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults setObject:forKey:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m") lineNumber:70 description:@"invalid nil value for '%s'", "defaultName"];
}

- (void)removeObjectForKey:(id)a3
{
  if (a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1D5024;
    v3[3] = &unk_45B138;
    v3[4] = a3;
    [(THBookUserDefaults *)self p_modifyBookDefaultsDictionary:v3];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults removeObjectForKey:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m") lineNumber:82 description:@"invalid nil value for '%s'", "defaultName"];
  }
}

- (BOOL)BOOLForKey:(id)a3
{
  [(THBookUserDefaults *)self objectForKey:a3];
  objc_opt_class();
  objc_super v3 = (void *)TSUDynamicCast();
  if (v3 || (objc_opt_class(), (objc_super v3 = (void *)TSUDynamicCast()) != 0))
  {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  v6 = +[NSNumber numberWithBool:a3];

  [(THBookUserDefaults *)self setObject:v6 forKey:a4];
}

- (void)registerDefaults:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1D5158;
  v3[3] = &unk_45B138;
  v3[4] = a3;
  [(THBookUserDefaults *)self p_modifyBookDefaultsDictionary:v3];
}

- (void)p_readBookDefaultsDictionary:(id)a3
{
  objc_opt_class();
  [+[NSUserDefaults standardUserDefaults] objectForKey:self->_bookID];
  uint64_t v5 = TSUCheckedDynamicCast();
  v6 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v6(a3, v5);
}

- (void)p_modifyBookDefaultsDictionary:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_1D4D88;
  v12 = sub_1D4D98;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1D541C;
  v7[3] = &unk_45B160;
  v7[4] = &v8;
  [(THBookUserDefaults *)self p_readBookDefaultsDictionary:v7];
  if (!v9[5])
  {
    id v5 = +[NSMutableDictionary dictionary];
    v9[5] = (uint64_t)v5;
  }
  (*((void (**)(id))a3 + 2))(a3);
  v6 = +[NSUserDefaults standardUserDefaults];
  [(NSUserDefaults *)v6 setObject:v9[5] forKey:self->_bookID];
  _Block_object_dispose(&v8, 8);
}

@end