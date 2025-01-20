@interface _SSBDatabaseUpdateFetchDataSessionHandler
- (_SSBDatabaseUpdateFetchDataSessionHandler)initWithCompletionHandler:(void *)a3 provider:(int)a4;
- (id).cxx_construct;
- (id)initWithCompletionHandler:(id *)a1 provider:(id *)a2;
- (id)initWithCompletionHandler:provider:;
- (uint64_t)initWithCompletionHandler:provider:;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)initWithCompletionHandler:provider:;
@end

@implementation _SSBDatabaseUpdateFetchDataSessionHandler

- (_SSBDatabaseUpdateFetchDataSessionHandler)initWithCompletionHandler:(void *)a3 provider:(int)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)_SSBDatabaseUpdateFetchDataSessionHandler;
  id v6 = [(_SSBDatabaseUpdateFetchDataSessionHandler *)&v15 init];
  if (v6)
  {
    _ZNSt3__115allocate_sharedB8sn180100I12ByteProviderNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(from);
    v7 = (std::__shared_weak_count *)*((void *)v6 + 3);
    *((_OWORD *)v6 + 1) = *(_OWORD *)from;
    from[0] = 0;
    from[1] = 0;
    if (v7)
    {
      std::__shared_weak_count::__release_shared[abi:sn180100](v7);
      if (from[1]) {
        std::__shared_weak_count::__release_shared[abi:sn180100]((std::__shared_weak_count *)from[1]);
      }
    }
    objc_initWeak(&location, v6);
    std::allocate_shared[abi:sn180100]<ReadStream,std::allocator<ReadStream>,std::shared_ptr<ByteProvider> &,void>((uint64_t *)v6 + 2, &v13);
    objc_copyWeak(&to, &location);
    std::__function::__value_func<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::__value_func[abi:sn180100]((uint64_t)v18, (uint64_t)a3);
    v8 = operator new(8uLL);
    long long v16 = v13;
    long long v13 = 0uLL;
    objc_moveWeak(from, &to);
    if (v19)
    {
      if (v19 == v18)
      {
        v21 = &from[1];
        (*(void (**)(void *, id *))(v18[0] + 24))(v18, &from[1]);
      }
      else
      {
        v21 = v19;
        v19 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    v23 = 0;
    v9 = (id *)operator new(0x30uLL);
    id *v9 = &unk_26BE0C3C0;
    objc_moveWeak(v9 + 1, from);
    if (v21)
    {
      if (v21 == &from[1])
      {
        v9[5] = v9 + 2;
        (*((void (**)(id *))from[1] + 3))(&from[1]);
      }
      else
      {
        v9[5] = v21;
        v21 = 0;
      }
    }
    else
    {
      v9[5] = 0;
    }
    v23 = v9;
    Backend::Google::FetchThreatListUpdatesResponseParser::FetchThreatListUpdatesResponseParser(v8, &v16, v22);
    std::__function::__value_func<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&)>::~__value_func[abi:sn180100](v22);
    std::__function::__value_func<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::~__value_func[abi:sn180100](&from[1]);
    objc_destroyWeak(from);
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:sn180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    v10 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v8;
    if (v10)
    {
      if (*(void *)v10) {
        (*(void (**)(void))(*(void *)v10 + 8))();
      }
      operator delete(v10);
    }
    std::__function::__value_func<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::~__value_func[abi:sn180100](v18);
    objc_destroyWeak(&to);
    if (*((void *)&v13 + 1)) {
      std::__shared_weak_count::__release_shared[abi:sn180100](*((std::__shared_weak_count **)&v13 + 1));
    }
    *((_DWORD *)v6 + 12) = a4;
    id v11 = v6;
    objc_destroyWeak(&location);
  }

  return (_SSBDatabaseUpdateFetchDataSessionHandler *)v6;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  v7 = (void (**)(id, BOOL))a6;
  v7[2](v7, [v8 statusCode] == 200);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  self->_receivedBytes += [v6 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80___SSBDatabaseUpdateFetchDataSessionHandler_URLSession_dataTask_didReceiveData___block_invoke;
  v7[3] = &unk_263FCE3D0;
  v7[4] = self;
  [v6 enumerateByteRangesUsingBlock:v7];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a5;
  logDataLength(self->_receivedBytes, self->_provider);
  if (v7)
  {
    objc_storeStrong((id *)&self->_error, a5);
    ByteProvider::readFailedWithError(self->_byteProvider.__ptr_);
  }
  else
  {
    ByteProvider::finishedReadingSuccessfully(self->_byteProvider.__ptr_);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  cntrl = self->_byteProvider.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:sn180100]((std::__shared_weak_count *)cntrl);
  }
  value = self->_parser.__ptr_.__value_;
  self->_parser.__ptr_.__value_ = 0;
  if (value)
  {
    if (*(void *)value) {
      (*(void (**)(void))(*(void *)value + 8))();
    }
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (uint64_t)initWithCompletionHandler:provider:
{
  *(void *)a1 = &unk_26BE0C3C0;
  std::__function::__value_func<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::~__value_func[abi:sn180100]((void *)(a1 + 16));
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)initWithCompletionHandler:provider:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v5 = WeakRetained;
  if (WeakRetained && (id v6 = (void *)*((void *)WeakRetained + 5)) != 0)
  {
    v7[0] = 0;
    char v8 = 0;
    std::function<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::operator()(a1 + 16, (uint64_t)v7, v6);
    if (v8)
    {
      v9 = (void **)v7;
      std::vector<Backend::Google::ListUpdateResponse>::__destroy_vector::operator()[abi:sn180100](&v9);
    }
  }
  else
  {
    std::function<void ()(std::optional<Backend::Google::FetchThreatListUpdatesResponse> &&,NSError *)>::operator()(a1 + 16, a2, 0);
  }
}

- (id)initWithCompletionHandler:provider:
{
  *(void *)a2 = &unk_26BE0C3C0;
  return std::__compressed_pair_elem<-[_SSBDatabaseUpdateFetchDataSessionHandler initWithCompletionHandler:provider:]::$_0,0,false>::__compressed_pair_elem[abi:sn180100]<-[_SSBDatabaseUpdateFetchDataSessionHandler initWithCompletionHandler:provider:]::$_0 const&,0ul>((id *)(a2 + 8), (id *)(a1 + 8));
}

- (id)initWithCompletionHandler:(id *)a1 provider:(id *)a2
{
  return a1;
}

@end