@interface SIMovReader
- (MOVStreamReader)reader;
- (__CVBuffer)getCurrentReadBufferForTrack:(id)a3;
- (__CVBuffer)readFrame:(id *)a3;
- (id).cxx_construct;
- (id)initReaderWithVideoURL:(id)a3 andTrackName:(id)a4;
- (id)initReaderWithVideoURL:(id)a3 trackList:(id)a4;
- (int64_t)readNextAvaliableFrame:(id *)a3;
- (void)dealloc;
- (void)setReader:(id)a3;
@end

@implementation SIMovReader

- (id)initReaderWithVideoURL:(id)a3 trackList:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v48 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SIMovReader;
  v6 = [(SIMovReader *)&v61 init];
  if (v6)
  {
    id v60 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x263F535C8]) initWithURL:v50 error:&v60];
    id v49 = v60;
    [(SIMovReader *)v6 setReader:v7];

    v8 = [(SIMovReader *)v6 reader];
    LODWORD(v7) = v8 == 0;

    if (v7)
    {
      v46 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v65 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
        __int16 v66 = 1025;
        int v67 = 75;
        __int16 v68 = 2113;
        id v69 = v49;
        _os_log_impl(&dword_21B697000, v46, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Couldn't open video track with error %{private}@ ***", buf, 0x1Cu);
      }

LABEL_33:
      v44 = 0;
    }
    else
    {
      v6->_readCount = 0;
      v6->_bufferEOFCount = 0;
      v6->_unsigned int lcmfps = 1;
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      trackInfos = v6->trackInfos;
      v6->trackInfos = v9;

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      obuint64_t j = v48;
      uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v57 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            v15 = [(SIMovReader *)v6 reader];
            int v16 = [v15 containsStream:v14];

            if (!v16)
            {
              v45 = __SceneIntelligenceLogSharedInstance();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136381187;
                v65 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
                __int16 v66 = 1025;
                int v67 = 93;
                __int16 v68 = 2113;
                id v69 = v14;
                _os_log_impl(&dword_21B697000, v45, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** video doesn't contain steam %{private}@ ***", buf, 0x1Cu);
              }

              goto LABEL_33;
            }
            v17 = [(SIMovReader *)v6 reader];
            [v17 getFrameRateForStream:v14];
            double v19 = v18;

            v20 = [SIMovStreamInfo alloc];
            v21 = [(SIMovReader *)v6 reader];
            uint64_t v22 = [v21 getOutputPixelFormatForStream:v14];
            v23 = [(SIMovReader *)v6 reader];
            [v23 getSizeForStream:v14];
            unsigned int v24 = vcvtad_u64_f64(v19);
            id v27 = -[SIMovStreamInfo initInfoWithTrackName:frameRate:pixelBufferFormat:resolution:](v20, "initInfoWithTrackName:frameRate:pixelBufferFormat:resolution:", v14, v22, (double)v24, v25, v26);
            [(NSMutableDictionary *)v6->trackInfos setObject:v27 forKeyedSubscript:v14];

            LOBYTE(v28) = 0;
            if (v24 && v6->_lcmfps)
            {
              unsigned int v29 = v24;
              unsigned int lcmfps = v6->_lcmfps;
              do
              {
                unsigned int v31 = lcmfps;
                unsigned int lcmfps = v29;
                unsigned int v29 = v31 % v29;
              }
              while (v29);
              unsigned int v28 = v6->_lcmfps / lcmfps * v24;
            }
            v6->_unsigned int lcmfps = v28;
            v32 = __SceneIntelligenceLogSharedInstance();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              v33 = [(NSMutableDictionary *)v6->trackInfos objectForKeyedSubscript:v14];
              v34 = [v33 description];
              *(_DWORD *)buf = 136381187;
              v65 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
              __int16 v66 = 1025;
              int v67 = 91;
              __int16 v68 = 2113;
              id v69 = v34;
              _os_log_impl(&dword_21B697000, v32, OS_LOG_TYPE_DEBUG, " %{private}s:%{private}d *** reading track from video: \n %{private}@ ***", buf, 0x1Cu);
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v35 = v6->trackInfos;
      uint64_t v36 = [(NSMutableDictionary *)v35 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v53 != v37) {
              objc_enumerationMutation(v35);
            }
            uint64_t v39 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            unsigned int v40 = v6->_lcmfps;
            v41 = [(NSMutableDictionary *)v6->trackInfos objectForKeyedSubscript:v39];
            unsigned int v42 = [v41 frameRate];
            v43 = [(NSMutableDictionary *)v6->trackInfos objectForKeyedSubscript:v39];
            [v43 setReadCycle:v40 / v42];
          }
          uint64_t v36 = [(NSMutableDictionary *)v35 countByEnumeratingWithState:&v52 objects:v62 count:16];
        }
        while (v36);
      }

      v44 = v6;
    }
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)initReaderWithVideoURL:(id)a3 andTrackName:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v11[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v9 = [(SIMovReader *)self initReaderWithVideoURL:v6 trackList:v8];

  return v9;
}

- (void)dealloc
{
  for (uint64_t i = &self->_pixelBufferMap.__table_.__p1_; ; CVPixelBufferRelease((CVPixelBufferRef)i[5].__value_.__next_))
  {
    uint64_t i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, __CVBuffer *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, __CVBuffer *>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)SIMovReader;
  [(SIMovReader *)&v4 dealloc];
}

- (__CVBuffer)readFrame:(id *)a3
{
  v5 = [(SIMovReader *)self reader];
  id v6 = [(NSMutableDictionary *)self->trackInfos allKeys];
  id v7 = [v6 firstObject];
  uint64_t v10 = 0;
  v8 = (__CVBuffer *)[v5 copyNextFrameForStream:v7 timestamp:a3 error:&v10];

  return v8;
}

- (__CVBuffer)getCurrentReadBufferForTrack:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  id v9 = __p;
  v5 = (__CVBuffer *)*((void *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v9)+ 5);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

- (int64_t)readNextAvaliableFrame:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = self->trackInfos;
  id v4 = 0;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v5)
  {
    uint64_t v30 = *(void *)v34;
    p_pixelBufferMap = &self->_pixelBufferMap;
    uint64_t v7 = 1;
    *(void *)&long long v6 = 136380931;
    long long v27 = v6;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        int readCount = self->_readCount;
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->trackInfos, "objectForKeyedSubscript:", v9, v27);
        BOOL v12 = readCount % (int)[v11 readCycle] == 0;

        if (v12)
        {
          id v13 = v9;
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v13 UTF8String]);
          uint64_t v37 = (long long *)__p;
          v14 = (CVPixelBufferRef *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v37);
          CVPixelBufferRelease(v14[5]);
          if (v41 < 0) {
            operator delete(*(void **)__p);
          }
          v15 = [(SIMovReader *)self reader];
          int v16 = [(NSMutableDictionary *)self->trackInfos objectForKeyedSubscript:v13];
          v17 = [v16 name];
          id v32 = v4;
          uint64_t v18 = [v15 copyNextFrameForStream:v17 timestamp:a3 error:&v32];
          id v19 = v32;

          id v20 = v13;
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v20 UTF8String]);
          uint64_t v37 = (long long *)__p;
          *((void *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v37)+ 5) = v18;
          if (v41 < 0) {
            operator delete(*(void **)__p);
          }

          std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v20 UTF8String]);
          uint64_t v37 = (long long *)__p;
          uint64_t v21 = *((void *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v37)+ 5);
          if (v41 < 0)
          {
            operator delete(*(void **)__p);
            if (v21)
            {
LABEL_13:
              uint64_t v7 = 0;
LABEL_19:
              id v4 = v19;
              goto LABEL_20;
            }
          }
          else if (v21)
          {
            goto LABEL_13;
          }
          if (v19)
          {
            uint64_t v22 = __SceneIntelligenceLogSharedInstance();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__p = v27;
              *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
              __int16 v39 = 1025;
              int v40 = 148;
              _os_log_impl(&dword_21B697000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to read the buffer. ***", __p, 0x12u);
            }

            uint64_t v7 = 2;
            goto LABEL_19;
          }
          uint64_t v7 = 0;
          id v4 = 0;
          ++self->_bufferEOFCount;
        }
LABEL_20:
        ++v8;
      }
      while (v5 != v8);
      uint64_t v23 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      uint64_t v5 = v23;
      if (!v23) {
        goto LABEL_26;
      }
    }
  }
  uint64_t v7 = 1;
LABEL_26:

  uint64_t bufferEOFCount = self->_bufferEOFCount;
  self->_int readCount = (self->_readCount + 1) % self->_lcmfps;
  if ([(NSMutableDictionary *)self->trackInfos count] == bufferEOFCount) {
    int64_t v25 = 3;
  }
  else {
    int64_t v25 = v7;
  }

  return v25;
}

- (MOVStreamReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_pixelBufferMap);
  objc_storeStrong((id *)&self->trackInfos, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  return self;
}

@end