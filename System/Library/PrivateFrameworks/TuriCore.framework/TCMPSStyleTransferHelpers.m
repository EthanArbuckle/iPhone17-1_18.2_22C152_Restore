@interface TCMPSStyleTransferHelpers
+ (id)toNSDictionary:()map<std:()turi:()std:(std:(turi::neural_net::shared_float_array>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :neural_net::shared_float_array :string;
+ (map<std::string,)fromNSDictionary:()std:(std:(turi:(id)a2 :(SEL)a3 neural_net:(id)a4 :shared_float_array>>> *__return_ptr)retstr :allocator<std::pair<const)std::string :less<std::string>;
+ (vector<unsigned)toVector:(id)a2;
+ (void)fromNSDictionary:;
@end

@implementation TCMPSStyleTransferHelpers

+ (vector<unsigned)toVector:(id)a2
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  id v24 = v5;
  std::vector<unsigned long>::reserve((void **)&retstr->var0, [v5 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v24;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) integerValue];
        unint64_t v11 = v10;
        var1 = retstr->var1;
        var0 = retstr->var2.var0;
        if (var1 >= var0)
        {
          v15 = retstr->var0;
          uint64_t v16 = var1 - retstr->var0;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 61) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v18 = (char *)var0 - (char *)v15;
          if (v18 >> 2 > v17) {
            unint64_t v17 = v18 >> 2;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v17;
          }
          if (v19)
          {
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&retstr->var2, v19);
            v15 = retstr->var0;
            var1 = retstr->var1;
          }
          else
          {
            v20 = 0;
          }
          v21 = (unint64_t *)&v20[8 * v16];
          unint64_t *v21 = v11;
          v14 = v21 + 1;
          while (var1 != v15)
          {
            unint64_t v22 = *--var1;
            *--v21 = v22;
          }
          retstr->var0 = v21;
          retstr->var1 = v14;
          retstr->var2.var0 = (unint64_t *)&v20[8 * v19];
          if (v15) {
            operator delete(v15);
          }
        }
        else
        {
          unint64_t *var1 = v10;
          v14 = var1 + 1;
        }
        retstr->var1 = v14;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  return result;
}

+ (map<std::string,)fromNSDictionary:()std:(std:(turi:(id)a2 :(SEL)a3 neural_net:(id)a4 :shared_float_array>>> *__return_ptr)retstr :allocator<std::pair<const)std::string :less<std::string>
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  retstr->var0.var2.var0 = 0;
  retstr->var0.var1.var0.var0 = 0;
  v21 = (uint64_t **)retstr;
  retstr->var0.var0 = &retstr->var0.var1;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v6, "objectForKey:", v10, v21);
        v12 = [v11 data];
        v13 = [v11 shape];
        unint64_t v14 = [v12 length];
        +[TCMPSStyleTransferHelpers toVector:v13];
        v15 = (int *)v29;
        int v16 = 1;
        while (v15 != v30)
        {
          int v17 = *v15;
          v15 += 2;
          v16 *= v17;
        }
        uint64_t v27 = v16;
        long long v28 = (char *)(v14 >> 2);
        if (v14 >> 2 != v16)
        {
          v25[0] = &v28;
          v25[1] = &v27;
          +[TCMPSStyleTransferHelpers fromNSDictionary:]::$_0::operator()();
        }
        id v18 = v12;
        uint64_t v19 = [v18 bytes];
        v23 = 0;
        uint64_t v24 = 0;
        __p = 0;
        std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v29, (uint64_t)v30, ((char *)v30 - (unsigned char *)v29) >> 3);
        turi::neural_net::shared_float_array::copy(v19, (uint64_t)&__p, (uint64_t)v25);
        if (__p)
        {
          v23 = __p;
          operator delete(__p);
        }
        long long v28 = (char *)[v10 UTF8String];
        std::__tree<std::__value_type<std::string,turi::neural_net::shared_float_array>,std::__map_value_compare<std::string,std::__value_type<std::string,turi::neural_net::shared_float_array>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,turi::neural_net::shared_float_array>>>::__emplace_unique_impl<char const*,turi::neural_net::shared_float_array&>(v21, &v28, (uint64_t)v25);
        v25[0] = &unk_26D752D58;
        if (v26) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v26);
        }
        if (v29)
        {
          uint64_t v30 = (int *)v29;
          operator delete(v29);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  return result;
}

+ (void)fromNSDictionary:
{
  v1 = (int *)global_logger();
  if (v1[169] <= 6)
  {
    if (cppipc::must_cancel((cppipc *)v1)) {
      log_stream_dispatch<true>::exec(int,char const*,char const*,int,BOOL)::{lambda(void)#1}::operator()();
    }
    v2 = (file_logger *)global_logger();
    file_logger::start_stream(v2, 6, "/Library/Caches/com.apple.xbs/Sources/TuriCore/turicreate_oss/src/ml/neural_net/style_transfer/mps_style_transfer_backend.mm", "operator()", 56, 1);
    OUTLINED_FUNCTION_0();
    uint64_t v3 = file_logger::operator<<<std::string>(v0, (uint64_t)&__p);
    v4 = pthread_getspecific(*(void *)(v3 + 592));
    if (v4)
    {
      if (*((unsigned char *)v4 + 280))
      {
        std::endl[abi:ne180100]<char,std::char_traits<char>>(v4 + 2);
        file_logger::stream_flush((file_logger *)v3);
        if (*(_DWORD *)(v3 + 600) == 7)
        {
          __print_back_trace();
          exception = __cxa_allocate_exception(8uLL);
          void *exception = "LOG_FATAL encountered";
          __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
        }
      }
    }
    if (v8 < 0) {
      operator delete(__p);
    }
  }
  id v5 = __cxa_allocate_exception(0x18uLL);
  std::ostringstream::str[abi:ne180100]();
}

+ (id)toNSDictionary:()map<std:()turi:()std:(std:(turi::neural_net::shared_float_array>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :neural_net::shared_float_array :string
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)a3->var0.var0;
  p_var1 = &a3->var0.var1;
  id v6 = var0;
  if (var0 != p_var1)
  {
    do
    {
      char v8 = [MEMORY[0x263EFF8F8] dataWithBytes:(*(uint64_t (**)(void *))(*(void *)v6[8].var0.var0 + 16))(v6[8].var0.var0)+ 4 * (uint64_t)v6[10].var0.var0 length:4 * (uint64_t)v6[13].var0.var0];
      v9 = v6 + 4;
      if (SHIBYTE(v6[6].var0.var0) < 0) {
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v9->var0.var0;
      }
      uint64_t v10 = [NSString stringWithUTF8String:v9];
      [v4 setObject:v8 forKeyedSubscript:v10];

      unint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v6[1].var0.var0;
      if (v11)
      {
        do
        {
          v12 = v11;
          unint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v11->var0.var0;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v6[2].var0.var0;
          BOOL v13 = v12->var0.var0 == v6;
          id v6 = v12;
        }
        while (!v13);
      }
      id v6 = v12;
    }
    while (v12 != p_var1);
  }
  unint64_t v14 = (void *)[v4 copy];

  return v14;
}

@end