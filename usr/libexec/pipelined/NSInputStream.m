@interface NSInputStream
+ (pair<NSInputStream)ps_inputStreamWithData:(id)a3;
+ (pair<NSInputStream)ps_inputStreamWithFileAtPath:(const void *)a3;
+ (pair<NSInputStream)ps_inputStreamWithString:(id)a3;
+ (pair<NSInputStream)ps_inputStreamWithString:(id)a3 usingEncoding:(unint64_t)a4;
@end

@implementation NSInputStream

+ (pair<NSInputStream)ps_inputStreamWithFileAtPath:(const void *)a3
{
  v5 = v3;
  sub_100056B28((const char *)a3, 0, (int *)&v13);
  if (LODWORD(v13.__r_.__value_.__l.__data_) != 2)
  {
    sub_1000AE4B0(v11, "");
    sub_100234F6C("Can't create an input stream for something not a file @ ", &v13);
    if (*((char *)a3 + 23) < 0)
    {
      sub_1000559FC(&v14, *(void **)a3, *((void *)a3 + 1));
    }
    else
    {
      long long v14 = *(_OWORD *)a3;
      uint64_t v15 = *((void *)a3 + 2);
    }
    sub_10016A2C4((uint64_t)v11, (uint64_t)&v13, 2);
    if (SHIBYTE(v15) < 0)
    {
      operator delete((void *)v14);
      if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_8:
        if ((v12 & 0x80000000) == 0) {
          goto LABEL_9;
        }
LABEL_12:
        operator delete(v11[0]);
LABEL_9:
        sub_10014B3FC((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(v13.__r_.__value_.__l.__data_);
    if ((v12 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  off_t v6 = sub_100055960((uint64_t)a3, 0);
  v7 = +[NSString ps_stringWithSTL:a3];
  uint64_t *v5 = +[NSInputStream inputStreamWithFileAtPath:v7];
  v5[1] = v6;

  result.second = v9;
  result.first = v8;
  return result;
}

+ (pair<NSInputStream)ps_inputStreamWithString:(id)a3
{
  v3 = (NSInputStream *)+[NSInputStream ps_inputStreamWithString:a3 usingEncoding:4];
  result.second = v4;
  result.first = v3;
  return result;
}

+ (pair<NSInputStream)ps_inputStreamWithString:(id)a3 usingEncoding:(unint64_t)a4
{
  off_t v6 = v4;
  id v12 = a3;
  v7 = [v12 dataUsingEncoding:a4];
  uint64_t v8 = +[NSInputStream inputStreamWithData:v7];
  id v9 = [v7 length];
  *off_t v6 = v8;
  v6[1] = (uint64_t)v9;

  result.second = v11;
  result.first = v10;
  return result;
}

+ (pair<NSInputStream)ps_inputStreamWithData:(id)a3
{
  unint64_t v4 = v3;
  id v9 = a3;
  uint64_t v5 = +[NSInputStream inputStreamWithData:](NSInputStream, "inputStreamWithData:");
  id v6 = [v9 length];
  *unint64_t v4 = v5;
  v4[1] = (uint64_t)v6;

  result.second = v8;
  result.first = v7;
  return result;
}

@end