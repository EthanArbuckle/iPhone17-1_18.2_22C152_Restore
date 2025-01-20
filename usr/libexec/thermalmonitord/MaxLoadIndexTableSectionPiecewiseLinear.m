@interface MaxLoadIndexTableSectionPiecewiseLinear
- (MaxLoadIndexTableSectionPiecewiseLinear)initWithDecisionTreeSectionControlEfforts:(id)a3 maxLIs:(id)a4 unconstrainedMaxLI:(unint64_t)a5;
- (unint64_t)getControlEffortForMaxLI:(unint64_t)a3;
- (unint64_t)getMaxLI:(unint64_t)a3;
- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4;
@end

@implementation MaxLoadIndexTableSectionPiecewiseLinear

- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MaxLoadIndexTableSectionPiecewiseLinear;
  return [(MaxLoadIndexTableSection *)&v5 getReleaseMaxLI:a3 releaseRate:*(void *)&a4];
}

- (unint64_t)getMaxLI:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v4 = self->_pointCount - 1;
    objc_super v5 = self;
    while (v4)
    {
      unint64_t v6 = v5->_controlEfforts[1];
      objc_super v5 = (MaxLoadIndexTableSectionPiecewiseLinear *)((char *)v5 + 8);
      --v4;
      if (v6 >= a3)
      {
        unint64_t result = (v5->_controlEfforts[11] * (v6 - a3) + (a3 - v5->super._releaseRate) * v5->_maxLIs[0])
               / (v6 - v5->super._releaseRate);
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005CEE4();
    }
    unint64_t result = -1;
  }
  else
  {
    unint64_t result = self->_unconstrainedMaxLI;
  }
LABEL_10:
  self->super._maxLI = result;
  return result;
}

- (MaxLoadIndexTableSectionPiecewiseLinear)initWithDecisionTreeSectionControlEfforts:(id)a3 maxLIs:(id)a4 unconstrainedMaxLI:(unint64_t)a5
{
  v22.receiver = self;
  v22.super_class = (Class)MaxLoadIndexTableSectionPiecewiseLinear;
  v8 = [(MaxLoadIndexTableSection *)&v22 init];
  if (v8)
  {
    id v9 = [a3 count];
    if (v9 == [a4 count])
    {
      if (v9)
      {
        if ((unint64_t)v9 < 0xD)
        {
          unint64_t v10 = 0;
          unint64_t v11 = 0;
          unint64_t v12 = 0;
          v8->_unconstrainedMaxLI = a5;
          v8->_unint64_t pointCount = (unint64_t)v9;
          do
          {
            controlEfforts = v8->_controlEfforts;
            v8->_controlEfforts[v10] = (unint64_t)[a3 objectAtIndex:v10];
            id v14 = [[a4 objectAtIndex:v10] unsignedIntegerValue];
            unint64_t v15 = (unint64_t)v14;
            v8->_maxLIs[v10] = (unint64_t)v14;
            unint64_t v16 = v8->_controlEfforts[v10];
            if (v10)
            {
              if (v16 <= v12 || (unint64_t)v14 > v11)
              {
                v18 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<Error> Piecewise DT table non-monotonic", buf, 2u);
                  unint64_t v16 = controlEfforts[v10];
                  unint64_t v15 = v8->_maxLIs[v10];
                }
              }
            }
            ++v10;
            unint64_t pointCount = v8->_pointCount;
            unint64_t v11 = v15;
            unint64_t v12 = v16;
          }
          while (v10 < pointCount);
          if ((*controlEfforts || controlEfforts[pointCount - 1] != 255)
            && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_10005CE7C();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005CE48();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_10005CE14();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005CEB0();
    }
  }
  return v8;
}

- (unint64_t)getControlEffortForMaxLI:(unint64_t)a3
{
  if (self->_unconstrainedMaxLI <= a3) {
    return 0;
  }
  unint64_t v4 = self->_pointCount - 1;
  objc_super v5 = self;
  while (v4)
  {
    unint64_t v6 = v5->_maxLIs[1];
    objc_super v5 = (MaxLoadIndexTableSectionPiecewiseLinear *)((char *)v5 + 8);
    --v4;
    if (a3 >= v6)
    {
      unint64_t v7 = v5->_controlEfforts[11];
      if (v7 == v6)
      {
        if (a3 == v6) {
          unint64_t v8 = v5->_controlEfforts[0];
        }
        else {
          unint64_t v8 = 0;
        }
      }
      else
      {
        unint64_t v8 = (v5->_controlEfforts[0] * (v7 - a3) + v5->super._releaseRate * (a3 - v6)) / (v7 - v6);
      }
      if (byte_1000AA7A0)
      {
        uint64_t v13 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t releaseRate = v5->super._releaseRate;
          unint64_t v15 = v5->_controlEfforts[0];
          int v17 = 134219264;
          unint64_t v18 = v15;
          __int16 v19 = 2048;
          unint64_t v20 = releaseRate;
          __int16 v21 = 2048;
          unint64_t v22 = v6;
          __int16 v23 = 2048;
          unint64_t v24 = v7;
          __int16 v25 = 2048;
          unint64_t v26 = a3;
          __int16 v27 = 2048;
          unint64_t v28 = v8;
          unint64_t v10 = "<Notice> Seeding: CE+1 %lu CE %lu maxLI+1 %lu maxLI %lu maxLI %lu CE %lu";
          unint64_t v11 = v13;
          uint32_t v12 = 62;
          goto LABEL_17;
        }
      }
      return v8;
    }
  }
  unint64_t v8 = *(&self->super._releaseRate + self->_pointCount);
  if (byte_1000AA7A0)
  {
    uint64_t v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      unint64_t v18 = a3;
      __int16 v19 = 2048;
      unint64_t v20 = v8;
      unint64_t v10 = "<Notice> Seeding: Piecewise reverse DT maxLI:%lu controlEffort:%lu";
      unint64_t v11 = v9;
      uint32_t v12 = 22;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
    }
  }
  return v8;
}

@end