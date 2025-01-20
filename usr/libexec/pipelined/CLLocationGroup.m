@interface CLLocationGroup
+ (vector<std::string,)stringVectorFromNSArray:(id)a2;
+ (void)storeAverage:(id)a3 ofVertices:(id)a4;
- (BOOL)allowCellularDownload:(unint64_t)a3;
- (CLLocationGroup)init;
- (CLLocationGroup)initWithGroupId:(id)a3 locationIds:(id)a4 center:(id)a5 wifiOnlyDownloadLocIdxs:(const void *)a6 locationContext:(int64_t)a7 andTolerance:(double)a8;
- (ECEFCoordinate)centerECEF;
- (GeographicCoordinate)centerLatLon;
- (NSString)groupId;
- (basic_string<char,)getGroupId;
- (const)getLocationIds;
- (const)getVertices;
- (double)distance:(id)a3;
- (double)tolerance;
- (id).cxx_construct;
- (int64_t)locationContext;
- (set<unsigned)wifiOnlyDownloadLocIdxs;
- (vector<std::string,)locationIds;
- (void)setWifiOnlyDownloadLocIdxs:(set<unsigned)long;
@end

@implementation CLLocationGroup

- (basic_string<char,)getGroupId
{
  v3 = (const char *)[*(id *)(v1 + 16) UTF8String];
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)strlen(v3);
  if ((unint64_t)result >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000A6968();
  }
  unint64_t v5 = (unint64_t)result;
  if ((unint64_t)result >= 0x17)
  {
    unint64_t v6 = ((unint64_t)result & 0xFFFFFFFFFFFFFFF8) + 8;
    if (((unint64_t)result | 7) != 0x17) {
      unint64_t v6 = (unint64_t)result | 7;
    }
    unint64_t v7 = v6 + 1;
    v8 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v6 + 1);
    retstr->__r_.__value_.var0.var1.__size_ = v5;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = v7 | 0x8000000000000000;
    retstr->__r_.__value_.var0.var1.__data_ = (char *)v8;
    retstr = v8;
  }
  else
  {
    *((unsigned char *)&retstr->__r_.__value_.var0.var1 + 23) = (_BYTE)result;
    if (!result)
    {
      retstr->__r_.__value_.var0.var0.__data_[0] = 0;
      return result;
    }
  }
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)memmove(retstr, v3, v5);
  retstr->__r_.__value_.var0.var0.__data_[v5] = 0;
  return result;
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (BOOL)allowCellularDownload:(unint64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_;
  v4 = left;
  if (!left) {
    goto LABEL_12;
  }
  unint64_t v6 = p_pair1;
  do
  {
    unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)v4;
    }
    else {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&v4[1];
    }
    if (v8) {
      unint64_t v6 = v4;
    }
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > (void *)a3) {
LABEL_12:
  }
    unint64_t v6 = p_pair1;
  return v6 == p_pair1;
}

- (const)getLocationIds
{
  return &self->_locationIds;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (NSString)groupId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)distance:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[ENUCoordinate fromLatLonOrigin:self->_centerLatLon andEcefOrigin:self->_centerECEF andEcefPoint:v4];
  [v5 east];
  double v7 = v6;
  [v5 north];
  v14[0] = v7;
  v14[1] = v8;
  value = self->vertices.__ptr_.__value_;
  if (*value == value[1])
  {
    v12 = (void *)value[3];
    v13 = (void *)value[4];
    if (v12 == v13)
    {
LABEL_6:
      v17 = &off_10045FE58;
      v15.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.ap"
                            "p/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/us"
                            "r/local/include/boost/geometry/algorithms/detail/throw_on_empty_input.hpp";
      v15.i64[1] = (uint64_t)"void boost::geometry::detail::throw_on_empty_input(const Geometry &) [Geometry = boost::geom"
                            "etry::model::polygon<boost::geometry::model::d2::point_xy<double>>]";
      uint64_t v16 = 54;
      sub_1001DEE14((uint64_t)&v17, &v15);
    }
    while (*v12 == v12[1])
    {
      v12 += 3;
      if (v12 == v13) {
        goto LABEL_6;
      }
    }
  }
  double v10 = sub_10004CE90(v14, (uint64_t)value);

  return v10;
}

+ (void)storeAverage:(id)a3 ofVertices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 count];
  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      double v11 = 0.0;
      double v12 = 0.0;
      double v13 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          int8x16_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v15 x:v21];
          double v17 = v16;
          [v15 y];
          double v19 = v18;
          [v15 z];
          double v11 = v11 + v17;
          double v12 = v12 + v19;
          double v13 = v13 + v20;
        }
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
      double v12 = 0.0;
      double v13 = 0.0;
    }

    [v5 setFromX:v11 / (double)(unint64_t)v7 y:v12 / (double)(unint64_t)v7 z:v13 / (double)(unint64_t)v7];
  }
}

- (GeographicCoordinate)centerLatLon
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 32, 1);
}

- (ECEFCoordinate)centerECEF
{
  return (ECEFCoordinate *)objc_getProperty(self, a2, 24, 1);
}

- (CLLocationGroup)initWithGroupId:(id)a3 locationIds:(id)a4 center:(id)a5 wifiOnlyDownloadLocIdxs:(const void *)a6 locationContext:(int64_t)a7 andTolerance:(double)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v38.receiver = self;
  v38.super_class = (Class)CLLocationGroup;
  double v18 = [(CLLocationGroup *)&v38 init];
  double v19 = v18;
  double v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupId, a3);
    +[CLLocationGroup stringVectorFromNSArray:v16];
    p_begin = &v20->_locationIds.__begin_;
    begin = (void **)v20->_locationIds.__begin_;
    if (begin)
    {
      end = (void **)v20->_locationIds.__end_;
      long long v24 = v20->_locationIds.__begin_;
      if (end != begin)
      {
        do
        {
          if (*((char *)end - 1) < 0) {
            operator delete(*(end - 3));
          }
          end -= 3;
        }
        while (end != begin);
        long long v24 = *p_begin;
      }
      v20->_locationIds.__end_ = begin;
      operator delete(v24);
      *p_begin = 0;
      v20->_locationIds.__end_ = 0;
      v20->_locationIds.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v20->_locationIds.__begin_ = v36;
    v20->_locationIds.__end_cap_.__value_ = v37;
    v25 = [ECEFCoordinate alloc];
    [v17 x];
    double v27 = v26;
    [v17 y];
    double v29 = v28;
    [v17 z];
    v31 = [(ECEFCoordinate *)v25 initWithX:v27 y:v29 z:v30];
    centerECEF = v20->_centerECEF;
    v20->_centerECEF = v31;

    v33 = [[GeographicCoordinate alloc] initFromECEFCoordinate:v20->_centerECEF];
    centerLatLon = v20->_centerLatLon;
    v20->_centerLatLon = v33;

    v20->_tolerance = a8;
    if (&v19->_wifiOnlyDownloadLocIdxs != a6) {
      sub_10006D4D0((uint64_t **)&v19->_wifiOnlyDownloadLocIdxs, *(void **)a6, (void *)a6 + 1);
    }
    v20->_locationContext = a7;
    operator new();
  }

  return 0;
}

+ (vector<std::string,)stringVectorFromNSArray:(id)a2
{
  id v5 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  id v23 = v5;
  sub_10006D388((uint64_t)retstr, (unint64_t)[v5 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v23;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    id v24 = v6;
    do
    {
      id v9 = 0;
      id v25 = v7;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v27 + 1) + 8 * (void)v9);
        id v12 = v10;
        double v13 = (const char *)[v12 UTF8String];
        v14 = v13;
        double v26 = v13;
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          double v19 = sub_1001DFEB4(&retstr->__begin_, &v26);
          goto LABEL_17;
        }
        size_t v16 = strlen(v13);
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          sub_1000A6968();
        }
        size_t v17 = v16;
        if (v16 >= 0x17)
        {
          uint64_t v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v20 = v16 | 7;
          }
          uint64_t v21 = v20 + 1;
          double v18 = operator new(v20 + 1);
          end[1] = v17;
          end[2] = v21 | 0x8000000000000000;
          void *end = v18;
          id v6 = v24;
        }
        else
        {
          *((unsigned char *)end + 23) = v16;
          double v18 = end;
          if (!v16) {
            goto LABEL_16;
          }
        }
        memmove(v18, v14, v17);
LABEL_16:
        *((unsigned char *)v18 + v17) = 0;
        double v19 = (char *)(end + 3);
        retstr->__end_ = end + 3;
        id v7 = v25;
LABEL_17:
        retstr->__end_ = v19;

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  return result;
}

- (const)getVertices
{
  return &self->vertices;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  return self;
}

- (CLLocationGroup)init
{
  id v3 = objc_alloc_init((Class)NSArray);
  id v4 = objc_alloc_init(ECEFCoordinate);
  v8[0] = 0;
  v8[1] = 0;
  id v7 = v8;
  id v5 = [(CLLocationGroup *)self initWithGroupId:&stru_10046D078 locationIds:v3 center:v4 wifiOnlyDownloadLocIdxs:&v7 locationContext:0 andTolerance:0.0];
  sub_10006A9DC((uint64_t)&v7, v8[0]);

  return v5;
}

- (vector<std::string,)locationIds
{
  objc_copyCppObjectAtomic(retstr, &self->_locationIds, (void (__cdecl *)(void *, const void *))sub_1001DEBF0);
  return result;
}

- (set<unsigned)wifiOnlyDownloadLocIdxs
{
  objc_copyCppObjectAtomic(retstr, &self->_wifiOnlyDownloadLocIdxs, (void (__cdecl *)(void *, const void *))sub_1001DEC34);
  return result;
}

- (void)setWifiOnlyDownloadLocIdxs:(set<unsigned)long
{
}

- (void).cxx_destruct
{
  sub_10006A9DC((uint64_t)&self->_wifiOnlyDownloadLocIdxs, (void *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_);
  begin = (void **)self->_locationIds.__begin_;
  if (begin)
  {
    end = (void **)self->_locationIds.__end_;
    id v5 = self->_locationIds.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0) {
          operator delete(*(end - 3));
        }
        end -= 3;
      }
      while (end != begin);
      id v5 = self->_locationIds.__begin_;
    }
    self->_locationIds.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_centerLatLon, 0);
  objc_storeStrong((id *)&self->_centerECEF, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  value = (void **)self->vertices.__ptr_.__value_;
  self->vertices.__ptr_.__value_ = 0;
  if (value)
  {
    id v7 = (char *)value[3];
    if (v7)
    {
      uint64_t v8 = (char *)value[4];
      id v9 = value[3];
      if (v8 != v7)
      {
        id v10 = (char *)value[4];
        do
        {
          id v12 = (void *)*((void *)v10 - 3);
          v10 -= 24;
          double v11 = v12;
          if (v12)
          {
            *((void *)v8 - 2) = v11;
            operator delete(v11);
          }
          uint64_t v8 = v10;
        }
        while (v10 != v7);
        id v9 = value[3];
      }
      value[4] = v7;
      operator delete(v9);
    }
    double v13 = *value;
    if (*value)
    {
      value[1] = v13;
      operator delete(v13);
    }
    operator delete();
  }
}

@end