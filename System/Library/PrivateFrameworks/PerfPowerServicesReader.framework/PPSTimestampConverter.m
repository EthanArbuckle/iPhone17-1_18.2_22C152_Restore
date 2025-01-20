@interface PPSTimestampConverter
- (PPSTimestampConverter)initWithFilepath:(id)a3;
- (PPSTimestampConverter)initWithSubsystem:(id)a3 category:(id)a4;
- (double)epochTimeFromMonotonicTime:(double)a3;
- (double)localTimeFromMonotonicTime:(double)a3;
- (double)monotonicTimeFromEpochTime:(double)a3;
- (double)systemOffsetFromMonotonicTime:(double)a3;
- (double)timeZoneOffsetForMonotonicTime:(double)a3;
- (id).cxx_construct;
- (id)_tableNameForSystemOffset;
- (id)_tableNameForTimeZoneOffset;
- (vector<std::pair<double,)_systemOffsetsForTableName:()std:(double>>> *__return_ptr)retstr :(PPSTimestampConverter *)self allocator<std:(SEL)a3 :(id)a4 pair<double;
- (vector<std::pair<double,)_timeZoneOffsetsForTableName:()std:(double>>> *__return_ptr)retstr :(PPSTimestampConverter *)self allocator<std:(SEL)a3 :(id)a4 pair<double;
- (vector<std::pair<double,)systemOffsets;
- (vector<std::pair<double,)timeZoneOffsets;
- (void)_addSystemOffset:(double)a3 withMonotonicTime:(double)a4;
@end

@implementation PPSTimestampConverter

- (PPSTimestampConverter)initWithSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSTimestampConverter;
  v8 = [(PPSTimestampConverter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[PPSOnDeviceIngesterUtilities filepathForSubsystem:v6 category:v7];
    filepath = v8->_filepath;
    v8->_filepath = (NSURL *)v9;
  }
  return v8;
}

- (PPSTimestampConverter)initWithFilepath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSTimestampConverter;
  id v6 = [(PPSTimestampConverter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_filepath, a3);
  }

  return v7;
}

- (vector<std::pair<double,)systemOffsets
{
  v4 = self;
  objc_sync_enter(v4);
  p_begin = &v4->_systemOffsets.__begin_;
  if (v4->_systemOffsets.__begin_ == v4->_systemOffsets.__end_)
  {
    id v6 = [(PPSTimestampConverter *)v4 _tableNameForSystemOffset];
    [(PPSTimestampConverter *)v4 _systemOffsetsForTableName:v6];
    id v7 = *p_begin;
    if (*p_begin)
    {
      v4->_systemOffsets.__end_ = v7;
      operator delete(v7);
      *p_begin = 0;
      v4->_systemOffsets.__end_ = 0;
      v4->_systemOffsets.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v4->_systemOffsets.__begin_ = v9;
    v4->_systemOffsets.__end_cap_.__value_ = v10;
  }
  objc_sync_exit(v4);

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *)std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (long long *)v4->_systemOffsets.__begin_, (long long *)v4->_systemOffsets.__end_, ((char *)v4->_systemOffsets.__end_- (char *)v4->_systemOffsets.__begin_) >> 4);
}

- (vector<std::pair<double,)timeZoneOffsets
{
  v4 = self;
  objc_sync_enter(v4);
  p_begin = &v4->_timeZoneOffsets.__begin_;
  if (v4->_timeZoneOffsets.__begin_ == v4->_timeZoneOffsets.__end_)
  {
    id v6 = [(PPSTimestampConverter *)v4 _tableNameForTimeZoneOffset];
    [(PPSTimestampConverter *)v4 _timeZoneOffsetsForTableName:v6];
    id v7 = *p_begin;
    if (*p_begin)
    {
      v4->_timeZoneOffsets.__end_ = v7;
      operator delete(v7);
      *p_begin = 0;
      v4->_timeZoneOffsets.__end_ = 0;
      v4->_timeZoneOffsets.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v4->_timeZoneOffsets.__begin_ = v9;
    v4->_timeZoneOffsets.__end_cap_.__value_ = v10;
  }
  objc_sync_exit(v4);

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *)std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (long long *)v4->_timeZoneOffsets.__begin_, (long long *)v4->_timeZoneOffsets.__end_, ((char *)v4->_timeZoneOffsets.__end_- (char *)v4->_timeZoneOffsets.__begin_) >> 4);
}

- (double)epochTimeFromMonotonicTime:(double)a3
{
  -[PPSTimestampConverter systemOffsetFromMonotonicTime:](self, "systemOffsetFromMonotonicTime:");
  return v4 + a3;
}

- (double)localTimeFromMonotonicTime:(double)a3
{
  -[PPSTimestampConverter epochTimeFromMonotonicTime:](self, "epochTimeFromMonotonicTime:");
  double v6 = v5;
  [(PPSTimestampConverter *)self timeZoneOffsetForMonotonicTime:a3];
  return v6 + v7;
}

- (double)monotonicTimeFromEpochTime:(double)a3
{
  double v3 = 0.0;
  if (a3 > 0.0)
  {
    [(PPSTimestampConverter *)self systemOffsets];
    if (v14 != v15)
    {
      unint64_t v5 = ((char *)v15 - (char *)v14) >> 4;
      double v6 = v14;
      do
      {
        unint64_t v7 = v5 >> 1;
        v8 = &v6[2 * (v5 >> 1)];
        double v10 = *v8;
        double v11 = v8[1];
        long long v9 = v8 + 2;
        v5 += ~(v5 >> 1);
        if (v10 + v11 > a3) {
          unint64_t v5 = v7;
        }
        else {
          double v6 = v9;
        }
      }
      while (v5);
      if (v6 == v14) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = -1;
      }
      double v3 = a3 - v6[2 * v12 + 1];
    }
    if (v14) {
      operator delete(v14);
    }
  }
  return v3;
}

- (double)systemOffsetFromMonotonicTime:(double)a3
{
  [(PPSTimestampConverter *)self systemOffsets];
  if (v13 == v14)
  {
    double v11 = 0.0;
    if (!v13) {
      return v11;
    }
    goto LABEL_11;
  }
  unint64_t v4 = ((char *)v14 - (char *)v13) >> 4;
  unint64_t v5 = v13;
  do
  {
    unint64_t v6 = v4 >> 1;
    unint64_t v7 = &v5[2 * (v4 >> 1)];
    double v9 = *v7;
    v8 = v7 + 2;
    v4 += ~(v4 >> 1);
    if (v9 > a3) {
      unint64_t v4 = v6;
    }
    else {
      unint64_t v5 = v8;
    }
  }
  while (v4);
  if (v5 == v13) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = -1;
  }
  double v11 = v5[2 * v10 + 1];
  if (v13) {
LABEL_11:
  }
    operator delete(v13);
  return v11;
}

- (double)timeZoneOffsetForMonotonicTime:(double)a3
{
  [(PPSTimestampConverter *)self timeZoneOffsets];
  if (v13 == v14)
  {
    double v11 = 0.0;
    if (!v13) {
      return v11;
    }
    goto LABEL_11;
  }
  unint64_t v4 = ((char *)v14 - (char *)v13) >> 4;
  unint64_t v5 = v13;
  do
  {
    unint64_t v6 = v4 >> 1;
    unint64_t v7 = &v5[2 * (v4 >> 1)];
    double v9 = *v7;
    v8 = v7 + 2;
    v4 += ~(v4 >> 1);
    if (v9 > a3) {
      unint64_t v4 = v6;
    }
    else {
      unint64_t v5 = v8;
    }
  }
  while (v4);
  if (v5 == v13) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = -1;
  }
  double v11 = v5[2 * v10 + 1];
  if (v13) {
LABEL_11:
  }
    operator delete(v13);
  return v11;
}

- (vector<std::pair<double,)_systemOffsetsForTableName:()std:(double>>> *__return_ptr)retstr :(PPSTimestampConverter *)self allocator<std:(SEL)a3 :(id)a4 pair<double
{
  v44[1] = *MEMORY[0x263EF8340];
  id v26 = a4;
  unint64_t v6 = [PPSSQLiteEntity alloc];
  v44[0] = v26;
  unint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  v8 = [(PPSSQLiteEntity *)v6 initWithTableNames:v7];

  double v9 = [[PPSSQLiteQueryDescriptor alloc] initWithEntity:v8 predicate:0 limitCount:0 offsetCount:0];
  v43 = @"timestamp";
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  [(PPSSQLiteQueryDescriptor *)v9 setOrderByProperties:v10];

  v42 = @"ASC";
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  [(PPSSQLiteQueryDescriptor *)v9 setOrderByDirections:v11];

  uint64_t v12 = [[PPSSQLiteDatabase alloc] initWithDatabaseURL:self->_filepath];
  v13 = [[PPSSQLiteQuery alloc] initWithDatabase:v12 descriptor:v9];
  v41[0] = @"timestamp";
  v41[1] = @"system";
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x4812000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = &unk_258FC6B0D;
  v37 = 0;
  uint64_t v38 = 0;
  __p = 0;
  id v29 = 0;
  [(PPSSQLiteDatabase *)v12 openForReadingWithError:&v29];
  id v15 = v29;
  v27[5] = &v30;
  id v28 = v15;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __52__PPSTimestampConverter__systemOffsetsForTableName___block_invoke;
  v27[3] = &unk_265443688;
  v27[4] = v39;
  [(PPSSQLiteQuery *)v13 enumerateProperties:v14 error:&v28 enumerationHandler:v27];
  id v16 = v28;

  v17 = v16;
  [(PPSSQLiteDatabase *)v12 close];
  v20 = (__n128 *)v31[6];
  v19 = (__n128 *)v31[7];
  if ((char *)v19 - (char *)v20 < 1)
  {
    v21 = 0;
    uint64_t v23 = 0;
  }
  else
  {
    v21 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<std::pair<double,double>>(v19 - v20);
    uint64_t v23 = v22;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<std::pair<double,double> *>>(v20, v19, (uint64_t)&v40, v19 - v20, v21, v23, v18);
  if (v21) {
    operator delete(v21);
  }
  v24 = v31;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (long long *)v24[6], (long long *)v24[7], (v24[7] - v24[6]) >> 4);

  _Block_object_dispose(&v30, 8);
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v39, 8);

  return result;
}

uint64_t __52__PPSTimestampConverter__systemOffsetsForTableName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = (void *)MEMORY[0x25A2D4DD0]();
  double v7 = PPSSQLiteColumnValueWithNameAsDouble(a3, @"timestamp");
  double v8 = PPSSQLiteColumnValueWithNameAsDouble(a3, @"system");
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v10 = fabs(v9);
  double v11 = fmax(fabs(v8), 1.0);
  if (v11 < v10) {
    double v11 = v10;
  }
  if (vabdd_f64(v8, v9) > v11 * 2.22044605e-16)
  {
    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 8);
    v13 = (double *)v12[7];
    unint64_t v14 = v12[8];
    if ((unint64_t)v13 >= v14)
    {
      uint64_t v16 = v12[6];
      uint64_t v17 = ((uint64_t)v13 - v16) >> 4;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60) {
        std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v19 = v14 - v16;
      if (v19 >> 3 > v18) {
        unint64_t v18 = v19 >> 3;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,double>>>((uint64_t)(v12 + 8), v20);
      uint64_t v22 = (double *)&v21[16 * v17];
      v24 = &v21[16 * v23];
      *uint64_t v22 = v7;
      v22[1] = v8;
      id v15 = v22 + 2;
      id v26 = (char *)v12[6];
      v25 = (char *)v12[7];
      if (v25 != v26)
      {
        do
        {
          *((_OWORD *)v22 - 1) = *((_OWORD *)v25 - 1);
          v22 -= 2;
          v25 -= 16;
        }
        while (v25 != v26);
        v25 = (char *)v12[6];
      }
      v12[6] = v22;
      v12[7] = v15;
      v12[8] = v24;
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      double *v13 = v7;
      v13[1] = v8;
      id v15 = v13 + 2;
    }
    v12[7] = v15;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  }

  return 1;
}

- (id)_tableNameForSystemOffset
{
  unint64_t v3 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:self->_filepath]- 1;
  if (v3 > 4)
  {
    unint64_t v4 = 0;
    id v5 = 0;
  }
  else
  {
    unint64_t v4 = off_2654436A8[v3];
    id v5 = off_2654436D0[v3];
  }
  unint64_t v6 = +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:self->_filepath subsystem:v5 category:v4];
  return v6;
}

- (id)_tableNameForTimeZoneOffset
{
  unint64_t v3 = +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:self->_filepath subsystem:@"TimeZone" category:@"LocaleMetrics" metricName:@"SecondsFromGMT"];
  unint64_t v4 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v3];
  if (!v3)
  {
    unint64_t v5 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:self->_filepath]- 1;
    if (v5 >= 5)
    {
      double v7 = @"TimeZone";
      unint64_t v6 = @"LocaleMetrics";
    }
    else
    {
      unint64_t v6 = off_2654436F8[v5];
      double v7 = off_265443720[v5];
    }
    uint64_t v8 = +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:self->_filepath subsystem:v7 category:v6];

    unint64_t v4 = (void *)v8;
  }

  return v4;
}

- (vector<std::pair<double,)_timeZoneOffsetsForTableName:()std:(double>>> *__return_ptr)retstr :(PPSTimestampConverter *)self allocator<std:(SEL)a3 :(id)a4 pair<double
{
  v44[1] = *MEMORY[0x263EF8340];
  id v26 = a4;
  unint64_t v6 = [PPSSQLiteEntity alloc];
  v44[0] = v26;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  uint64_t v8 = [(PPSSQLiteEntity *)v6 initWithTableNames:v7];

  double v9 = [[PPSSQLiteQueryDescriptor alloc] initWithEntity:v8 predicate:0 limitCount:0 offsetCount:0];
  v43 = @"timestamp";
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  [(PPSSQLiteQueryDescriptor *)v9 setOrderByProperties:v10];

  v42 = @"ASC";
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  [(PPSSQLiteQueryDescriptor *)v9 setOrderByDirections:v11];

  uint64_t v12 = [[PPSSQLiteDatabase alloc] initWithDatabaseURL:self->_filepath];
  v13 = [[PPSSQLiteQuery alloc] initWithDatabase:v12 descriptor:v9];
  v41[0] = @"timestamp";
  v41[1] = @"SecondsFromGMT";
  unint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x4812000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = &unk_258FC6B0D;
  v37 = 0;
  uint64_t v38 = 0;
  __p = 0;
  id v29 = 0;
  [(PPSSQLiteDatabase *)v12 openForReadingWithError:&v29];
  id v15 = v29;
  v27[5] = &v30;
  id v28 = v15;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __54__PPSTimestampConverter__timeZoneOffsetsForTableName___block_invoke;
  v27[3] = &unk_265443688;
  v27[4] = v39;
  [(PPSSQLiteQuery *)v13 enumerateProperties:v14 error:&v28 enumerationHandler:v27];
  id v16 = v28;

  uint64_t v17 = v16;
  [(PPSSQLiteDatabase *)v12 close];
  unint64_t v20 = (__n128 *)v31[6];
  uint64_t v19 = (__n128 *)v31[7];
  if ((char *)v19 - (char *)v20 < 1)
  {
    v21 = 0;
    uint64_t v23 = 0;
  }
  else
  {
    v21 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<std::pair<double,double>>(v19 - v20);
    uint64_t v23 = v22;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<std::pair<double,double> *>>(v20, v19, (uint64_t)&v40, v19 - v20, v21, v23, v18);
  if (v21) {
    operator delete(v21);
  }
  v24 = v31;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (long long *)v24[6], (long long *)v24[7], (v24[7] - v24[6]) >> 4);

  _Block_object_dispose(&v30, 8);
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v39, 8);

  return result;
}

uint64_t __54__PPSTimestampConverter__timeZoneOffsetsForTableName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = (void *)MEMORY[0x25A2D4DD0]();
  double v7 = PPSSQLiteColumnValueWithNameAsDouble(a3, @"timestamp");
  double v8 = PPSSQLiteColumnValueWithNameAsDouble(a3, @"SecondsFromGMT");
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v10 = fabs(v9);
  double v11 = fmax(fabs(v8), 1.0);
  if (v11 < v10) {
    double v11 = v10;
  }
  if (vabdd_f64(v8, v9) > v11 * 2.22044605e-16)
  {
    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 8);
    v13 = (double *)v12[7];
    unint64_t v14 = v12[8];
    if ((unint64_t)v13 >= v14)
    {
      uint64_t v16 = v12[6];
      uint64_t v17 = ((uint64_t)v13 - v16) >> 4;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60) {
        std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v19 = v14 - v16;
      if (v19 >> 3 > v18) {
        unint64_t v18 = v19 >> 3;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,double>>>((uint64_t)(v12 + 8), v20);
      uint64_t v22 = (double *)&v21[16 * v17];
      v24 = &v21[16 * v23];
      *uint64_t v22 = v7;
      v22[1] = v8;
      id v15 = v22 + 2;
      id v26 = (char *)v12[6];
      v25 = (char *)v12[7];
      if (v25 != v26)
      {
        do
        {
          *((_OWORD *)v22 - 1) = *((_OWORD *)v25 - 1);
          v22 -= 2;
          v25 -= 16;
        }
        while (v25 != v26);
        v25 = (char *)v12[6];
      }
      v12[6] = v22;
      v12[7] = v15;
      v12[8] = v24;
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      double *v13 = v7;
      v13[1] = v8;
      id v15 = v13 + 2;
    }
    v12[7] = v15;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  }

  return 1;
}

- (void)_addSystemOffset:(double)a3 withMonotonicTime:(double)a4
{
  p_end_cap = &self->_systemOffsets.__end_cap_;
  value = (double *)self->_systemOffsets.__end_cap_.__value_;
  end = (double *)self->_systemOffsets.__end_;
  if (end >= value)
  {
    p_systemOffsets = &self->_systemOffsets;
    begin = (double *)self->_systemOffsets.__begin_;
    uint64_t v13 = ((char *)end - (char *)begin) >> 4;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60) {
      std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (char *)value - (char *)begin;
    if (v15 >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,double>>>((uint64_t)p_end_cap, v16);
      begin = (double *)self->_systemOffsets.__begin_;
      end = (double *)self->_systemOffsets.__end_;
    }
    else
    {
      uint64_t v17 = 0;
    }
    unint64_t v18 = (double *)&v17[16 * v13];
    uint64_t v19 = &v17[16 * v16];
    *unint64_t v18 = a4;
    v18[1] = a3;
    double v10 = v18 + 2;
    if (end != begin)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)end - 1);
        v18 -= 2;
        end -= 2;
      }
      while (end != begin);
      begin = (double *)p_systemOffsets->__begin_;
    }
    self->_systemOffsets.__begin_ = v18;
    self->_systemOffsets.__end_ = v10;
    self->_systemOffsets.__end_cap_.__value_ = v19;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    double *end = a4;
    end[1] = a3;
    double v10 = end + 2;
  }
  self->_systemOffsets.__end_ = v10;
}

- (void).cxx_destruct
{
  begin = self->_timeZoneOffsets.__begin_;
  if (begin)
  {
    self->_timeZoneOffsets.__end_ = begin;
    operator delete(begin);
  }
  unint64_t v4 = self->_systemOffsets.__begin_;
  if (v4)
  {
    self->_systemOffsets.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end