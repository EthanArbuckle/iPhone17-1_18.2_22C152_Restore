@interface NSString
- (id)UTF8DataWithMaxLength:(unint64_t)a3 ellipsis:(BOOL)a4 isTruncated:(BOOL *)a5;
- (id)UTF8StringWithMaxLength:(unint64_t)a3;
- (id)substringWithValidUnicode;
@end

@implementation NSString

- (id)substringWithValidUnicode
{
  if ([(NSString *)self length])
  {
    if (([(NSString *)self characterAtIndex:(char *)[(NSString *)self length] - 1] & 0xFC00) == 0xD800)
    {
      v3 = [(NSString *)self substringToIndex:(char *)[(NSString *)self length] - 1];
    }
    else
    {
      v3 = self;
    }
  }
  else
  {
    v3 = &stru_1000B2890;
  }

  return v3;
}

- (id)UTF8DataWithMaxLength:(unint64_t)a3 ellipsis:(BOOL)a4 isTruncated:(BOOL *)a5
{
  BOOL v6 = a4;
  unint64_t v9 = [(NSString *)self lengthOfBytesUsingEncoding:4];
  if (v9 >= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v9 <= a3 || !v6)
  {
    a3 = v10;
    if (v10)
    {
LABEL_15:
      int v13 = 0;
      unint64_t v12 = a3;
      goto LABEL_16;
    }
LABEL_22:
    id v17 = objc_alloc_init((Class)NSData);
    goto LABEL_23;
  }
  unint64_t v12 = a3 - 3;
  if (a3 < 3)
  {
    v14 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_1000752F0(a3, v14);
      if (a3) {
        goto LABEL_15;
      }
    }
    else if (a3)
    {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  int v13 = 1;
LABEL_16:
  __chkstk_darwin();
  bzero((char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = 0;
  -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0), v12, &v19, 4, 1, 0, [(NSString *)self length], &v20);
  if (v13)
  {
    uint64_t v15 = v19;
    v16 = (char *)&v19 + v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_WORD *)v16 = -32542;
    v16[2] = -90;
    uint64_t v19 = v15 + 3;
  }
  if (a5) {
    *a5 = v21 != 0;
  }
  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v19);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v17;
}

- (id)UTF8StringWithMaxLength:(unint64_t)a3
{
  v3 = [(NSString *)self UTF8DataWithMaxLength:a3 ellipsis:0 isTruncated:0];
  if ([v3 length])
  {
    id v4 = objc_alloc((Class)NSString);
    id v5 = v3;
    id v6 = [v4 initWithBytes:[v5 bytes] length:[v5 length] encoding:4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end