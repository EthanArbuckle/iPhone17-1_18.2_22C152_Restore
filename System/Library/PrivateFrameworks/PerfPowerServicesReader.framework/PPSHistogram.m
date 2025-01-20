@interface PPSHistogram
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistogram:(id)a3;
- (NSArray)dimensions;
- (NSArray)metrics;
- (PPSHistogram)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5;
- (PPSHistogram)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5 samples:(id)a6;
- (PPSHistogram)initWithCoder:(id)a3;
- (PPSHistogram)initWithDimensions:(id)a3;
- (PPSHistogram)initWithHistogram:(id)a3;
- (__n128)counts:;
- (id).cxx_construct;
- (id)JSONRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)counts:(BOOL)a3;
- (id)createArrayFromDimensionIdx:(unint64_t)a3 withFlowBins:(BOOL)a4;
- (id)debugDescription;
- (id)description;
- (id)dictionary;
- (id)indicesFor:(id)a3;
- (uint64_t)counts:;
- (unint64_t)hash;
- (unint64_t)rank;
- (unint64_t)size;
- (unint64_t)sum:(BOOL)a3;
- (void)JSONRepresentation;
- (void)counts:;
- (void)encodeWithCoder:(id)a3;
- (void)recordSample:(id)a3;
- (void)reset;
@end

@implementation PPSHistogram

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PPSHistogram allocWithZone:a3];
  return [(PPSHistogram *)v4 initWithHistogram:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSHistogram)initWithCoder:(id)a3
{
  v9[35] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPSHistogram;
  if ([(PPSHistogram *)&v8 init])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_PPSHistogram"];
    std::string::basic_string[abi:ne180100](__p, (void *)[v5 bytes], objc_msgSend(v5, "length"));
    std::istringstream::basic_istringstream[abi:ne180100](v9, __p, 8);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    boost::archive::text_iarchive::text_iarchive();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v4[33] = *(void **)MEMORY[0x263EF8340];
  id v3 = a3;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v4);
  boost::archive::text_oarchive::text_oarchive();
}

- (PPSHistogram)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = a5;
  v8.receiver = self;
  v8.super_class = (Class)PPSHistogram;
  if ([(PPSHistogram *)&v8 init]) {
    operator new();
  }

  return 0;
}

- (PPSHistogram)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5 samples:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a6;
  v12 = -[PPSHistogram initWithBinCount:range:metricName:](self, "initWithBinCount:range:metricName:", a3, a5, var0, var1);
  v13 = v12;
  if (v12)
  {
    if (!v12->_histogramPtr.__ptr_.__value_)
    {
      v19 = 0;
      goto LABEL_13;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v25 = *(void *)(*((void *)&v21 + 1) + 8 * v17);
          v18 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v25, 1, (void)v21);
          [(PPSHistogram *)v13 recordSample:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v15);
    }
  }
  v19 = v13;
LABEL_13:

  return v19;
}

- (PPSHistogram)initWithDimensions:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  uint64_t v74 = 0;
  unint64_t v75 = 0;
  unint64_t v76 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = a3;
  uint64_t v50 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v71;
LABEL_3:
    uint64_t v52 = 0;
    while (1)
    {
      if (*(void *)v71 != v51) {
        objc_enumerationMutation(obj);
      }
      id v3 = *(void **)(*((void *)&v70 + 1) + 8 * v52);
      int v4 = [v3 size];
      [v3 range];
      double v6 = v5;
      [v3 range];
      double v8 = v7;
      if (v4)
      {
        if (v6 == 0.0 && v7 == 0.0)
        {
          uint64_t v9 = [v3 edges];
          BOOL v10 = [v9 count] == 0;

          if (v10)
          {
            v46 = logHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              -[PPSHistogram initWithDimensions:]();
            }
            goto LABEL_76;
          }
        }
      }
      if (v8 < v6) {
        break;
      }
      if (!v4
        || ([v3 edges],
            id v11 = objc_claimAutoreleasedReturnValue(),
            BOOL v12 = [v11 count] == 0,
            v11,
            v12))
      {
        v46 = logHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[PPSHistogram initWithDimensions:].cold.5();
        }
LABEL_76:

        v45 = 0;
        goto LABEL_77;
      }
      LODWORD(v64) = v4;
      *((double *)&v64 + 1) = v6;
      double v65 = v8;
      char v66 = 0;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v13 = [v3 edges];
      BOOL v14 = [v13 count] == 0;

      if (!v14)
      {
        if ([v3 isCategoryDimension])
        {
          long long v62 = 0uLL;
          long long v63 = 0uLL;
          long long v60 = 0uLL;
          long long v61 = 0uLL;
          uint64_t v15 = [v3 edges];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v79 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v61;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v61 != v17) {
                  objc_enumerationMutation(v15);
                }
                std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v60 + 1) + 8 * i) UTF8String]);
                v19 = (_OWORD *)*((void *)&v67 + 1);
                if (*((void *)&v67 + 1) >= (unint64_t)v68)
                {
                  unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v67 + 1) - v67) >> 3);
                  unint64_t v22 = v21 + 1;
                  if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x5555555555555556 * ((uint64_t)(v68 - v67) >> 3) > v22) {
                    unint64_t v22 = 0x5555555555555556 * ((uint64_t)(v68 - v67) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68 - v67) >> 3) >= 0x555555555555555) {
                    unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v23 = v22;
                  }
                  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v68;
                  if (v23) {
                    long long v24 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v68, v23);
                  }
                  else {
                    long long v24 = 0;
                  }
                  uint64_t v25 = v24 + v21;
                  __v.__first_ = v24;
                  __v.__begin_ = v25;
                  __v.__end_cap_.__value_ = &v24[v23];
                  long long v26 = *(_OWORD *)__p;
                  v25->__r_.__value_.__r.__words[2] = v59;
                  *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v26;
                  __p[1] = 0;
                  std::string::size_type v59 = 0;
                  __p[0] = 0;
                  __v.__end_ = v25 + 1;
                  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)&v67, &__v);
                  uint64_t v27 = *((void *)&v67 + 1);
                  std::__split_buffer<std::string>::~__split_buffer(&__v);
                  *((void *)&v67 + 1) = v27;
                  if (SHIBYTE(v59) < 0) {
                    operator delete(__p[0]);
                  }
                }
                else
                {
                  long long v20 = *(_OWORD *)__p;
                  *(void *)(*((void *)&v67 + 1) + 16) = v59;
                  _OWORD *v19 = v20;
                  *((void *)&v67 + 1) = (char *)v19 + 24;
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v79 count:16];
            }
            while (v16);
          }
        }
        else
        {
          long long v56 = 0uLL;
          long long v57 = 0uLL;
          long long v54 = 0uLL;
          long long v55 = 0uLL;
          uint64_t v15 = [v3 edges];
          uint64_t v28 = [v15 countByEnumeratingWithState:&v54 objects:v78 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v55 != v29) {
                  objc_enumerationMutation(v15);
                }
                [*(id *)(*((void *)&v54 + 1) + 8 * j) doubleValue];
                uint64_t v32 = v31;
                v33 = (char *)v69;
                if ((unint64_t)v69 >= *((void *)&v69 + 1))
                {
                  v35 = (char *)*((void *)&v68 + 1);
                  uint64_t v36 = (uint64_t)(v69 - *((void *)&v68 + 1)) >> 3;
                  unint64_t v37 = v36 + 1;
                  if ((unint64_t)(v36 + 1) >> 61) {
                    std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v38 = *((void *)&v69 + 1) - *((void *)&v68 + 1);
                  if ((uint64_t)(*((void *)&v69 + 1) - *((void *)&v68 + 1)) >> 2 > v37) {
                    unint64_t v37 = v38 >> 2;
                  }
                  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v39 = v37;
                  }
                  if (v39)
                  {
                    v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69 + 8, v39);
                    v35 = (char *)*((void *)&v68 + 1);
                    v33 = (char *)v69;
                  }
                  else
                  {
                    v40 = 0;
                  }
                  v41 = &v40[8 * v36];
                  *(void *)v41 = v32;
                  v34 = v41 + 8;
                  while (v33 != v35)
                  {
                    uint64_t v42 = *((void *)v33 - 1);
                    v33 -= 8;
                    *((void *)v41 - 1) = v42;
                    v41 -= 8;
                  }
                  *((void *)&v68 + 1) = v41;
                  *(void *)&long long v69 = v34;
                  *((void *)&v69 + 1) = &v40[8 * v39];
                  if (v35) {
                    operator delete(v35);
                  }
                }
                else
                {
                  *(void *)long long v69 = v31;
                  v34 = v33 + 8;
                }
                *(void *)&long long v69 = v34;
              }
              uint64_t v28 = [v15 countByEnumeratingWithState:&v54 objects:v78 count:16];
            }
            while (v28);
          }
        }
      }
      unint64_t v43 = v75;
      if (v75 >= v76)
      {
        uint64_t v44 = std::vector<pps::AxisConfig_Internal>::__emplace_back_slow_path<pps::AxisConfig_Internal&>(&v74, &v64);
      }
      else
      {
        std::allocator<pps::AxisConfig_Internal>::construct[abi:ne180100]<pps::AxisConfig_Internal,pps::AxisConfig_Internal&>((uint64_t)&v76, v75, &v64);
        uint64_t v44 = v43 + 80;
      }
      unint64_t v75 = v44;
      if (*((void *)&v68 + 1))
      {
        *(void *)&long long v69 = *((void *)&v68 + 1);
        operator delete(*((void **)&v68 + 1));
      }
      __v.__first_ = (std::__split_buffer<std::string>::pointer)&v67;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
      if (++v52 == v50)
      {
        uint64_t v50 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
        if (v50) {
          goto LABEL_3;
        }
        goto LABEL_67;
      }
    }
    v46 = logHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[PPSHistogram initWithDimensions:].cold.4();
    }
    goto LABEL_76;
  }
LABEL_67:

  v53.receiver = self;
  v53.super_class = (Class)PPSHistogram;
  if ([(PPSHistogram *)&v53 init]) {
    operator new();
  }
  v45 = (PPSHistogram *)0;
  self = v45;
LABEL_77:
  *(void *)&long long v64 = &v74;
  std::vector<pps::AxisConfig_Internal>::__destroy_vector::operator()[abi:ne180100]((void ***)&v64);

  return v45;
}

- (BOOL)isEqualToHistogram:(id)a3
{
  int v4 = a3;
  unint64_t v5 = [(PPSHistogram *)self rank];
  if (v5 != [v4 rank]) {
    goto LABEL_12;
  }
  unint64_t v6 = 0;
  while (v6 < [(PPSHistogram *)self rank])
  {
    double v7 = [(PPSHistogram *)self dimensions];
    double v8 = [v7 objectAtIndexedSubscript:v6];
    [v8 range];
    double v10 = v9;
    double v12 = v11;
    v13 = [v4 dimensions];
    BOOL v14 = [v13 objectAtIndexedSubscript:v6];
    [v14 range];
    double v16 = v15;
    double v18 = v17;

    char v19 = 0;
    if (v10 == v16)
    {
      ++v6;
      if (v12 == v18) {
        continue;
      }
    }
    goto LABEL_13;
  }
  if (v4
    && (unint64_t v20 = -[PPSHistogram size](self, "size"), v20 == [v4 size])
    && (unint64_t v21 = -[PPSHistogram sum:](self, "sum:", 1), v21 == [v4 sum:1]))
  {
    value = self->_histogramPtr.__ptr_.__value_;
    unint64_t v23 = (uint64_t *)v4[1];
    if (value == (Histogram_Internal *)v23) {
      char v19 = 1;
    }
    else {
      char v19 = pps::Histogram_Internal::operator==((uint64_t)value, v23);
    }
  }
  else
  {
LABEL_12:
    char v19 = 0;
  }
LABEL_13:

  return v19;
}

- (NSArray)metrics
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  int v4 = [(PPSHistogram *)self dimensions];
  unint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v6 = [(PPSHistogram *)self dimensions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) metricName];
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v11 = (void *)[v5 copy];
  return (NSArray *)v11;
}

- (unint64_t)rank
{
  return pps::Histogram_Internal::axisCount((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_);
}

- (unint64_t)size
{
  return pps::Histogram_Internal::binCount((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_);
}

- (id)JSONRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  int v4 = [(PPSHistogram *)self dimensions];
  unint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v6 = [(PPSHistogram *)self dimensions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) performSelector:sel_dictionary];
        if (v10) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  double v11 = objc_opt_new();
  double v12 = [(PPSHistogram *)self counts:0];
  [v11 setObject:v12 forKeyedSubscript:@"counts"];

  [v11 setObject:v5 forKeyedSubscript:@"dimensions"];
  long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PPSHistogram sum:](self, "sum:", 0));
  [v11 setObject:v13 forKeyedSubscript:@"sum"];

  id v18 = 0;
  long long v14 = [MEMORY[0x263F08900] dataWithJSONObject:v11 options:1 error:&v18];
  id v15 = v18;
  if (v15)
  {
    long long v16 = PPSReaderLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PPSHistogram JSONRepresentation]();
    }
  }
  return v14;
}

- (id)counts:(BOOL)a3
{
  BOOL v4 = a3;
  v13[4] = *MEMORY[0x263EF8340];
  pps::Histogram_Internal::data((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, a3, (uint64_t)__p, v3);
  unint64_t v6 = [(PPSHistogram *)self createArrayFromDimensionIdx:0 withFlowBins:v4];
  uint64_t v10 = 0;
  v12[3] = 0;
  uint64_t v7 = operator new(0x20uLL);
  *uint64_t v7 = &unk_270704CA8;
  v7[1] = &v10;
  v7[2] = __p;
  v7[3] = v12;
  v13[3] = v7;
  std::__function::__value_func<void ()(NSMutableArray *)>::swap[abi:ne180100](v13, v12);
  std::__function::__value_func<void ()(NSMutableArray *)>::~__value_func[abi:ne180100](v13);
  std::function<void ()(NSMutableArray *)>::operator()((uint64_t)v12, v6);
  uint64_t v8 = (void *)[v6 copy];
  std::__function::__value_func<void ()(NSMutableArray *)>::~__value_func[abi:ne180100](v12);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v8;
}

- (id)indicesFor:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  long long v73 = 0;
  uint64_t v74 = 0;
  unint64_t v75 = 0;
  id v63 = a3;
  std::vector<double>::reserve(&v73, [v63 count]);
  long long v62 = self;
  pps::Histogram_Internal::categoriesPerAxis((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, &v71);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v4 = v63;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = *(void *)v68;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v68 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v67 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 doubleValue];
          double v11 = v10;
          double v12 = v74;
          if (v74 >= (double *)v75)
          {
            long long v13 = (double *)v73;
            uint64_t v14 = ((char *)v74 - (unsigned char *)v73) >> 3;
            unint64_t v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61) {
              std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v16 = v75 - (unsigned char *)v73;
            if ((v75 - (unsigned char *)v73) >> 2 > v15) {
              unint64_t v15 = v16 >> 2;
            }
            if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v15;
            }
            if (v17)
            {
              id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v75, v17);
              long long v13 = (double *)v73;
              double v12 = v74;
            }
            else
            {
              id v18 = 0;
            }
            uint64_t v28 = (double *)&v18[8 * v14];
            *uint64_t v28 = v11;
            uint64_t v24 = v28 + 1;
            while (v12 != v13)
            {
              uint64_t v29 = *((void *)v12-- - 1);
              *((void *)v28-- - 1) = v29;
            }
LABEL_74:
            long long v73 = v28;
            uint64_t v74 = v24;
            unint64_t v75 = &v18[8 * v17];
            if (v13) {
              operator delete(v13);
            }
            goto LABEL_76;
          }
          goto LABEL_28;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        long long v19 = v72[0];
        if (!v72[0]) {
          goto LABEL_27;
        }
        long long v20 = v72;
        do
        {
          long long v21 = v19;
          long long v22 = v20;
          int v23 = *((_DWORD *)v19 + 8);
          if (v23 >= v6) {
            long long v20 = (char **)v19;
          }
          else {
            v19 += 8;
          }
          long long v19 = *(char **)v19;
        }
        while (v19);
        if (v20 == v72) {
          goto LABEL_27;
        }
        if (v23 < v6) {
          long long v21 = (char *)v22;
        }
        if (*((_DWORD *)v21 + 8) > v6)
        {
LABEL_27:
          double v11 = (double)(unint64_t)objc_msgSend(v4, "count", v62);
          double v12 = v74;
          if (v74 >= (double *)v75)
          {
            long long v13 = (double *)v73;
            uint64_t v25 = ((char *)v74 - (unsigned char *)v73) >> 3;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 61) {
              std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v27 = v75 - (unsigned char *)v73;
            if ((v75 - (unsigned char *)v73) >> 2 > v26) {
              unint64_t v26 = v27 >> 2;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v26;
            }
            if (v17)
            {
              id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v75, v17);
              long long v13 = (double *)v73;
              double v12 = v74;
            }
            else
            {
              id v18 = 0;
            }
            uint64_t v28 = (double *)&v18[8 * v25];
            *uint64_t v28 = v11;
            uint64_t v24 = v28 + 1;
            while (v12 != v13)
            {
              uint64_t v44 = *((void *)v12-- - 1);
              *((void *)v28-- - 1) = v44;
            }
            goto LABEL_74;
          }
LABEL_28:
          double *v12 = v11;
          uint64_t v24 = v12 + 1;
LABEL_76:
          uint64_t v74 = v24;
          goto LABEL_77;
        }
        memset(&v66, 0, sizeof(v66));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v66, (long long *)v20[5], (long long *)v20[6], 0xAAAAAAAAAAAAAAABLL * ((v20[6] - v20[5]) >> 3));
        std::string::size_type size = v66.__r_.__value_.__l.__size_;
        std::string::size_type v31 = v66.__r_.__value_.__r.__words[0];
        for (double i = 0.0; v31 != size; v31 += 24)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "UTF8String", v62));
          uint64_t v33 = *(unsigned __int8 *)(v31 + 23);
          if ((v33 & 0x80u) == 0) {
            v34 = (void *)*(unsigned __int8 *)(v31 + 23);
          }
          else {
            v34 = *(void **)(v31 + 8);
          }
          unint64_t v35 = v65;
          int v36 = (char)v65;
          if ((v65 & 0x80u) != 0) {
            unint64_t v35 = (unint64_t)__p[1];
          }
          if (v34 == (void *)v35)
          {
            if ((v65 & 0x80u) == 0) {
              unint64_t v37 = __p;
            }
            else {
              unint64_t v37 = (void **)__p[0];
            }
            if ((v33 & 0x80) != 0)
            {
              BOOL v42 = memcmp(*(const void **)v31, v37, *(void *)(v31 + 8)) == 0;
              if (v36 < 0) {
                goto LABEL_63;
              }
            }
            else if (*(unsigned char *)(v31 + 23))
            {
              uint64_t v38 = 0;
              uint64_t v39 = v33 - 1;
              do
              {
                int v40 = *(unsigned __int8 *)(v31 + v38);
                int v41 = *((unsigned __int8 *)v37 + v38);
                BOOL v42 = v40 == v41;
              }
              while (v40 == v41 && v39 != v38++);
              if ((char)v65 < 0)
              {
LABEL_63:
                operator delete(__p[0]);
                if (v42) {
                  break;
                }
                goto LABEL_64;
              }
            }
            else
            {
              BOOL v42 = 1;
              if ((char)v65 < 0) {
                goto LABEL_63;
              }
            }
          }
          else
          {
            BOOL v42 = 0;
            if ((char)v65 < 0) {
              goto LABEL_63;
            }
          }
          if (v42) {
            break;
          }
LABEL_64:
          double i = i + 1.0;
        }
        v45 = v74;
        if (v74 >= (double *)v75)
        {
          v47 = (double *)v73;
          uint64_t v48 = ((char *)v74 - (unsigned char *)v73) >> 3;
          unint64_t v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 61) {
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v50 = v75 - (unsigned char *)v73;
          if ((v75 - (unsigned char *)v73) >> 2 > v49) {
            unint64_t v49 = v50 >> 2;
          }
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v49;
          }
          if (v51)
          {
            uint64_t v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v75, v51);
            v47 = (double *)v73;
            v45 = v74;
          }
          else
          {
            uint64_t v52 = 0;
          }
          objc_super v53 = (double *)&v52[8 * v48];
          *objc_super v53 = i;
          v46 = v53 + 1;
          while (v45 != v47)
          {
            uint64_t v54 = *((void *)v45-- - 1);
            *((void *)v53-- - 1) = v54;
          }
          long long v73 = v53;
          uint64_t v74 = v46;
          unint64_t v75 = &v52[8 * v51];
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *uint64_t v74 = i;
          v46 = v45 + 1;
        }
        uint64_t v74 = v46;
        __p[0] = &v66;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
LABEL_77:
        ++v6;
        ++v8;
      }
      while (v8 != v5);
      uint64_t v55 = [v4 countByEnumeratingWithState:&v67 objects:v76 count:16];
      uint64_t v5 = v55;
    }
    while (v55);
  }

  pps::Histogram_Internal::indicesOfSample((pps::Histogram_Internal *)v62->_histogramPtr.__ptr_.__value_, &v73, &v66.__r_.__value_.__l.__data_);
  long long v56 = objc_opt_new();
  std::string::size_type v58 = v66.__r_.__value_.__l.__size_;
  for (uint64_t j = (int *)v66.__r_.__value_.__r.__words[0]; j != (int *)v58; ++j)
  {
    std::string::size_type v59 = objc_msgSend(NSNumber, "numberWithInteger:", *j, v62);
    [v56 addObject:v59];
  }
  long long v60 = objc_msgSend(v56, "copy", v62);

  if (v66.__r_.__value_.__r.__words[0])
  {
    v66.__r_.__value_.__l.__size_ = v66.__r_.__value_.__r.__words[0];
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<int,std::vector<std::string>>,std::__map_value_compare<int,std::__value_type<int,std::vector<std::string>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<std::string>>>>::destroy((uint64_t)&v71, v72[0]);
  if (v73)
  {
    uint64_t v74 = (double *)v73;
    operator delete(v73);
  }

  return v60;
}

- (void)recordSample:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  long long v67 = 0;
  long long v68 = 0;
  long long v69 = 0;
  id v56 = a3;
  pps::Histogram_Internal::categoriesPerAxis((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, &v65);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v4 = v56;
  long long v57 = self;
  uint64_t v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v61, v70, 16, v56);
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = *(void *)v62;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v61 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 doubleValue];
          double v11 = v10;
          double v12 = v68;
          if (v68 < (double *)v69) {
            goto LABEL_28;
          }
          long long v13 = (double *)v67;
          uint64_t v14 = ((char *)v68 - (unsigned char *)v67) >> 3;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 61) {
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v16 = v69 - (unsigned char *)v67;
          if ((v69 - (unsigned char *)v67) >> 2 > v15) {
            unint64_t v15 = v16 >> 2;
          }
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v15;
          }
          if (v17)
          {
            id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69, v17);
            long long v13 = (double *)v67;
            double v12 = v68;
          }
          else
          {
            id v18 = 0;
          }
          uint64_t v28 = (double *)&v18[8 * v14];
          *uint64_t v28 = v11;
          uint64_t v24 = v28 + 1;
          while (v12 != v13)
          {
            uint64_t v29 = *((void *)v12-- - 1);
            *((void *)v28-- - 1) = v29;
          }
          goto LABEL_74;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        long long v19 = v66[0];
        if (!v66[0]) {
          goto LABEL_27;
        }
        long long v20 = v66;
        do
        {
          long long v21 = v19;
          long long v22 = v20;
          int v23 = *((_DWORD *)v19 + 8);
          if (v23 >= v6) {
            long long v20 = (char **)v19;
          }
          else {
            v19 += 8;
          }
          long long v19 = *(char **)v19;
        }
        while (v19);
        if (v20 == v66) {
          goto LABEL_27;
        }
        if (v23 < v6) {
          long long v21 = (char *)v22;
        }
        if (*((_DWORD *)v21 + 8) > v6)
        {
LABEL_27:
          double v11 = (double)(int)[v4 count];
          double v12 = v68;
          if (v68 < (double *)v69)
          {
LABEL_28:
            double *v12 = v11;
            uint64_t v24 = v12 + 1;
LABEL_76:
            long long v68 = v24;
            goto LABEL_77;
          }
          long long v13 = (double *)v67;
          uint64_t v25 = ((char *)v68 - (unsigned char *)v67) >> 3;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 61) {
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v27 = v69 - (unsigned char *)v67;
          if ((v69 - (unsigned char *)v67) >> 2 > v26) {
            unint64_t v26 = v27 >> 2;
          }
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v26;
          }
          if (v17)
          {
            id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69, v17);
            long long v13 = (double *)v67;
            double v12 = v68;
          }
          else
          {
            id v18 = 0;
          }
          uint64_t v28 = (double *)&v18[8 * v25];
          *uint64_t v28 = v11;
          uint64_t v24 = v28 + 1;
          while (v12 != v13)
          {
            uint64_t v44 = *((void *)v12-- - 1);
            *((void *)v28-- - 1) = v44;
          }
LABEL_74:
          long long v67 = v28;
          long long v68 = v24;
          long long v69 = &v18[8 * v17];
          if (v13) {
            operator delete(v13);
          }
          goto LABEL_76;
        }
        memset(&v60, 0, sizeof(v60));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v60, (long long *)v20[5], (long long *)v20[6], 0xAAAAAAAAAAAAAAABLL * ((v20[6] - v20[5]) >> 3));
        std::string::size_type size = v60.__r_.__value_.__l.__size_;
        std::string::size_type v31 = v60.__r_.__value_.__r.__words[0];
        double v32 = 0.0;
        if (v60.__r_.__value_.__r.__words[0] == v60.__r_.__value_.__l.__size_) {
          goto LABEL_80;
        }
        while (1)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
          uint64_t v33 = *(unsigned __int8 *)(v31 + 23);
          if ((v33 & 0x80u) == 0) {
            v34 = (void *)*(unsigned __int8 *)(v31 + 23);
          }
          else {
            v34 = *(void **)(v31 + 8);
          }
          unint64_t v35 = v59;
          int v36 = (char)v59;
          if ((v59 & 0x80u) != 0) {
            unint64_t v35 = (unint64_t)__p[1];
          }
          if (v34 != (void *)v35)
          {
            BOOL v42 = 0;
            if (((char)v59 & 0x80000000) == 0) {
              goto LABEL_65;
            }
LABEL_64:
            operator delete(__p[0]);
            goto LABEL_65;
          }
          if ((v59 & 0x80u) == 0) {
            unint64_t v37 = __p;
          }
          else {
            unint64_t v37 = (void **)__p[0];
          }
          if ((v33 & 0x80) != 0)
          {
            BOOL v42 = memcmp(*(const void **)v31, v37, *(void *)(v31 + 8)) == 0;
            goto LABEL_63;
          }
          if (*(unsigned char *)(v31 + 23))
          {
            uint64_t v38 = 0;
            uint64_t v39 = v33 - 1;
            do
            {
              int v40 = *(unsigned __int8 *)(v31 + v38);
              int v41 = *((unsigned __int8 *)v37 + v38);
              BOOL v42 = v40 == v41;
            }
            while (v40 == v41 && v39 != v38++);
LABEL_63:
            if ((v36 & 0x80000000) == 0) {
              goto LABEL_65;
            }
            goto LABEL_64;
          }
          BOOL v42 = 1;
          if ((char)v59 < 0) {
            goto LABEL_64;
          }
LABEL_65:
          if (v42) {
            break;
          }
          double v32 = v32 + 1.0;
          v31 += 24;
          self = v57;
          if (v31 == size) {
            goto LABEL_80;
          }
        }
        self = v57;
LABEL_80:
        v45 = v68;
        if (v68 >= (double *)v69)
        {
          v47 = (double *)v67;
          uint64_t v48 = ((char *)v68 - (unsigned char *)v67) >> 3;
          unint64_t v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 61) {
            std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v50 = v69 - (unsigned char *)v67;
          if ((v69 - (unsigned char *)v67) >> 2 > v49) {
            unint64_t v49 = v50 >> 2;
          }
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v49;
          }
          if (v51)
          {
            uint64_t v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v69, v51);
            v47 = (double *)v67;
            v45 = v68;
          }
          else
          {
            uint64_t v52 = 0;
          }
          objc_super v53 = (double *)&v52[8 * v48];
          *objc_super v53 = v32;
          v46 = v53 + 1;
          while (v45 != v47)
          {
            uint64_t v54 = *((void *)v45-- - 1);
            *((void *)v53-- - 1) = v54;
          }
          long long v67 = v53;
          long long v68 = v46;
          long long v69 = &v52[8 * v51];
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *long long v68 = v32;
          v46 = v45 + 1;
        }
        long long v68 = v46;
        __p[0] = &v60;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
LABEL_77:
        ++v6;
        ++v8;
      }
      while (v8 != v5);
      uint64_t v55 = [v4 countByEnumeratingWithState:&v61 objects:v70 count:16];
      uint64_t v5 = v55;
    }
    while (v55);
  }

  pps::Histogram_Internal::record((uint64_t)self->_histogramPtr.__ptr_.__value_, (void **)&v67);
  std::__tree<std::__value_type<int,std::vector<std::string>>,std::__map_value_compare<int,std::__value_type<int,std::vector<std::string>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<std::string>>>>::destroy((uint64_t)&v65, v66[0]);
  if (v67)
  {
    long long v68 = (double *)v67;
    operator delete(v67);
  }
}

- (void)reset
{
}

- (unint64_t)sum:(BOOL)a3
{
  return pps::Histogram_Internal::sum((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, a3, v3);
}

- (id)createArrayFromDimensionIdx:(unint64_t)a3 withFlowBins:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(PPSHistogram *)self dimensions];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    double i = 0;
  }
  else
  {
    double v9 = [(PPSHistogram *)self dimensions];
    double v10 = [v9 objectAtIndexedSubscript:a3];
    if (v4) {
      uint64_t v11 = [v10 extent];
    }
    else {
      uint64_t v11 = [v10 size];
    }
    uint64_t v13 = v11;

    for (double i = [MEMORY[0x263EFF980] arrayWithCapacity:v13];
    {
      uint64_t v14 = [(PPSHistogram *)self dimensions];
      uint64_t v15 = [v14 count] - 1;

      if (v15 == a3)
      {
        [i addObject:&unk_270714878];
      }
      else
      {
        uint64_t v16 = [(PPSHistogram *)self createArrayFromDimensionIdx:a3 + 1 withFlowBins:v4];
        if (v16) {
          [i addObject:v16];
        }
      }
    }
  }
  return i;
}

- (id)dictionary
{
  double v3 = objc_opt_new();
  BOOL v4 = [(PPSHistogram *)self counts:0];
  [v3 setObject:v4 forKeyedSubscript:@"counts"];

  uint64_t v5 = [(PPSHistogram *)self dimensions];
  [v3 setObject:v5 forKeyedSubscript:@"dimensions"];

  int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PPSHistogram sum:](self, "sum:", 0));
  [v3 setObject:v6 forKeyedSubscript:@"sum"];

  uint64_t v7 = (void *)[v3 copy];
  return v7;
}

- (PPSHistogram)initWithHistogram:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPSHistogram;
  if ([(PPSHistogram *)&v7 init]) {
    operator new();
  }
  uint64_t v5 = (PPSHistogram *)0;

  return v5;
}

- (id)debugDescription
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = [(PPSHistogram *)self description];
  objc_super v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  return v7;
}

- (id)description
{
  v2 = [(PPSHistogram *)self dictionary];
  double v3 = [v2 description];

  return v3;
}

- (unint64_t)hash
{
  return pps::Histogram_Internal::hash((pps::Histogram_Internal *)self->_histogramPtr.__ptr_.__value_, v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPSHistogram *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PPSHistogram *)self isEqualToHistogram:v4];
  }

  return v5;
}

- (NSArray)dimensions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  value = self->_histogramPtr.__ptr_.__value_;
  self->_histogramPtr.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)counts:
{
}

- (__n128)counts:
{
  *(void *)a2 = &unk_270704CA8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)counts:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)initWithBinCount:range:metricName:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  uint64_t v2 = OUTLINED_FUNCTION_4(v0, v1);
  v3(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_258F16000, v4, v5, "Couldn't initialize <PPSHistogram: %p> due to std::exception - \"%s\"", v6, v7, v8, v9, v10);
}

- (void)initWithBinCount:range:metricName:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_258F16000, v0, v1, "Couldn't initialize <PPSHistogram: %p> due to unknown exception", v2, v3, v4, v5, v6);
}

- (void)initWithDimensions:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_258F16000, v0, v1, "Couldn't initialize <PPSHistogram: %p> - mismatch between number of bins and edges", v2, v3, v4, v5, v6);
}

- (void)initWithDimensions:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_258F16000, v0, v1, "Couldn't initialize <PPSHistogram: %p> - maxRange < maxRange", v2, v3, v4, v5, v6);
}

- (void)initWithDimensions:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_258F16000, v0, v1, "Couldn't initialize <PPSHistogram: %p> - invalid number of bins or edges in dimension", v2, v3, v4, v5, v6);
}

- (void)JSONRepresentation
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_258F16000, v0, OS_LOG_TYPE_DEBUG, "Error while parsing JSON data: %@", v1, 0xCu);
}

- (void)recordSample:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  uint64_t v2 = OUTLINED_FUNCTION_4(v0, v1);
  v3(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_258F16000, v4, v5, "Couldn't record sample for <PPSHistogram: %p> due to std::exception - \"%s\"", v6, v7, v8, v9, v10);
}

- (void)recordSample:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_258F16000, v0, v1, "Couldn't record sample for <PPSHistogram: %p> due to unknown exception", v2, v3, v4, v5, v6);
}

@end