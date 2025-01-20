@interface MaxLoadIndexTableSectionVariable
- (MaxLoadIndexTableSectionVariable)initWithDecisionTreeSection:(id)a3;
- (unint64_t)getMaxLI:(unint64_t)a3;
- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4;
@end

@implementation MaxLoadIndexTableSectionVariable

- (MaxLoadIndexTableSectionVariable)initWithDecisionTreeSection:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MaxLoadIndexTableSectionVariable;
  v4 = [(MaxLoadIndexTableSection *)&v12 init];
  if (v4)
  {
    if ([a3 count] == (id)256)
    {
      uint64_t v6 = 0;
      *(void *)&long long v5 = 134217984;
      long long v11 = v5;
      do
      {
        unsigned int v7 = [[a3 objectAtIndex:v6, v11] unsignedIntValue];
        uint64_t v8 = v7;
        if (v7 >= 0x66)
        {
          v9 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v11;
            uint64_t v14 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "<Error> Bad DT maxLI %ld", buf, 0xCu);
          }
          LOBYTE(v8) = 101;
        }
        v4->_maxLoadIndexTableSection[v6++] = v8;
      }
      while (v6 != 256);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005CDE0();
    }
  }
  return v4;
}

- (unint64_t)getMaxLI:(unint64_t)a3
{
  if (a3 > 0xFF) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = self->_maxLoadIndexTableSection[a3];
  }
  self->super._maxLI = v3;
  return v3;
}

- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MaxLoadIndexTableSectionVariable;
  return [(MaxLoadIndexTableSection *)&v5 getReleaseMaxLI:a3 releaseRate:*(void *)&a4];
}

@end