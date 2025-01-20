@interface CRLWPRangeMap
- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 affinity:(int)a5;
- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 isBackwardAffinities:(const void *)a5;
- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedPairIndexes:(const void *)a4;
- (_NSRange)mappedCharRange:(_NSRange)a3;
- (_NSRange)subRange;
- (_NSRange)unmappedCharRange:(_NSRange)a3;
- (id).cxx_construct;
- (unint64_t)mappedCharIndex:(unint64_t)a3;
- (unint64_t)p_extendLeftMappedIndex:(unint64_t)a3;
- (unint64_t)p_extendRightMappedIndex:(unint64_t)a3;
- (unint64_t)unmappedCharIndex:(unint64_t)a3;
- (vector<_CRLWPCharIndexAndAffinity,)mappedIndexes;
- (vector<_CRLWPCharIndexAndAffinity,)unmappedIndexes;
- (void)adjustByDelta:(int64_t)a3 startingAt:(unint64_t)a4;
- (void)setMappedIndexes:()vector<_CRLWPCharIndexAndAffinity;
- (void)setSubRange:(_NSRange)a3;
- (void)setUnmappedIndexes:()vector<_CRLWPCharIndexAndAffinity;
@end

@implementation CRLWPRangeMap

- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedPairIndexes:(const void *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = -[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:](self, "initWithSubRange:unmappedIndexes:affinity:", a3.location, a3.length, a4, 0);
  v8 = v7;
  if (v7)
  {
    v7->_subRange.NSUInteger location = location;
    v7->_subRange.NSUInteger length = length;
    uint64_t v9 = *((void *)a4 + 1) - *(void *)a4;
    if ((v9 & 8) != 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EAD48);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101099E80();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EAD68);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedPairIndexes:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:31 isFatal:0 description:"expected an even number of indexes"];
    }
    begin = v8->_unmappedIndexes.__begin_;
    end = v8->_unmappedIndexes.__end_;
    unint64_t v15 = (end - begin) >> 4;
    if (v15 != v9 >> 3 || v9 >> 3 != (v8->_mappedIndexes.__end_ - v8->_mappedIndexes.__begin_) >> 4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EAD88);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101099DF8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EADA8);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedPairIndexes:]");
      v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:32 isFatal:0 description:"index vector size is wrong"];

      begin = v8->_unmappedIndexes.__begin_;
      end = v8->_unmappedIndexes.__end_;
      unint64_t v15 = (end - begin) >> 4;
    }
    if (end != begin)
    {
      unint64_t v19 = 0;
      v20 = (_DWORD *)((char *)v8->_mappedIndexes.__begin_ + 24);
      v21 = (_DWORD *)((char *)begin + 24);
      do
      {
        *(v21 - 4) = 2;
        _DWORD *v21 = 1;
        v21 += 8;
        *(v20 - 4) = 2;
        _DWORD *v20 = 1;
        v20 += 8;
        v19 += 2;
      }
      while (v19 < v15);
    }
  }
  return v8;
}

- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 isBackwardAffinities:(const void *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = -[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:](self, "initWithSubRange:unmappedIndexes:affinity:", a3.location, a3.length, a4, 0);
  v10 = v9;
  if (v9)
  {
    v9->_subRange.NSUInteger location = location;
    v9->_subRange.NSUInteger length = length;
    uint64_t v12 = *(void *)a4;
    uint64_t v11 = *((void *)a4 + 1);
    unint64_t v13 = (v11 - *(void *)a4) >> 3;
    if (v13 != (v9->_unmappedIndexes.__end_ - v9->_unmappedIndexes.__begin_) >> 4
      || v13 != (v9->_mappedIndexes.__end_ - v9->_mappedIndexes.__begin_) >> 4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EADC8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101099F08();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EADE8);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      unint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedIndexes:isBackwardAffinities:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:52 isFatal:0 description:"index vector size is wrong"];
    }
    if (v11 != v12)
    {
      unint64_t v17 = 0;
      uint64_t v18 = *(void *)a5;
      if (v13 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v13;
      }
      v20 = (int *)((char *)v10->_unmappedIndexes.__begin_ + 8);
      v21 = (int *)((char *)v10->_mappedIndexes.__begin_ + 8);
      do
      {
        if ((*(void *)(v18 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17)) {
          int v22 = 1;
        }
        else {
          int v22 = 2;
        }
        int *v20 = v22;
        v20 += 4;
        int *v21 = v22;
        v21 += 4;
        ++v17;
      }
      while (v19 != v17);
    }
  }
  return v10;
}

- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 affinity:(int)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v59.receiver = self;
  v59.super_class = (Class)CRLWPRangeMap;
  uint64_t v9 = [(CRLWPRangeMap *)&v59 init];
  v10 = v9;
  if (v9)
  {
    v9->_subRange.NSUInteger location = location;
    v9->_subRange.NSUInteger length = length;
    uint64_t v12 = *(void *)a4;
    uint64_t v11 = *((void *)a4 + 1);
    unint64_t v13 = (v11 - *(void *)a4) >> 3;
    p_unmappedIndexes = &v9->_unmappedIndexes;
    sub_1002D8AC8((void **)&v9->_unmappedIndexes.__begin_, v13);
    p_mappedIndexes = &v10->_mappedIndexes;
    sub_1002D8AC8((void **)&v10->_mappedIndexes.__begin_, v13);
    unint64_t v56 = v13;
    if (v11 != v12)
    {
      uint64_t v14 = 0;
      if (v13 <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v13;
      }
      do
      {
        unint64_t v16 = *(void *)(*(void *)a4 + 8 * v14);
        NSUInteger v17 = v10->_subRange.location;
        NSUInteger v18 = v10->_subRange.length;
        BOOL v19 = v16 - v17 < v18 && v16 >= v17;
        NSUInteger v20 = v18 + v17;
        if (!v19 && v16 != v20)
        {
          unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EAE08);
          }
          v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            v53 = NSStringFromRange(v10->_subRange);
            *(_DWORD *)buf = 67110658;
            unsigned int v61 = v22;
            __int16 v62 = 2082;
            v63 = "-[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:]";
            __int16 v64 = 2082;
            v65 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm";
            __int16 v66 = 1024;
            int v67 = 78;
            __int16 v68 = 2048;
            unint64_t v69 = v16;
            __int16 v70 = 2048;
            unint64_t v71 = v56;
            __int16 v72 = 2114;
            v73 = v53;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d index is out of bounds: %lu / %lu : %{public}@ ", buf, 0x40u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EAE28);
          }
          v24 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          {
            v54 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v61 = v22;
            __int16 v62 = 2114;
            v63 = v54;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:]");
          v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
          v27 = NSStringFromRange(v10->_subRange);
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 78, 0, "index is out of bounds: %lu / %lu : %{public}@ ", v16, v56, v27);
        }
        end = v10->_unmappedIndexes.__end_;
        value = v10->_unmappedIndexes.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v31 = (end - p_unmappedIndexes->__begin_) >> 4;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60) {
            sub_100004E40();
          }
          uint64_t v33 = value - p_unmappedIndexes->__begin_;
          if (v33 >> 3 > v32) {
            unint64_t v32 = v33 >> 3;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v34 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34) {
            v35 = (char *)sub_10001EAB0((uint64_t)&v10->_unmappedIndexes.__end_cap_, v34);
          }
          else {
            v35 = 0;
          }
          v36 = &v35[16 * v31];
          *(void *)v36 = v16;
          *((_DWORD *)v36 + 2) = a5;
          *((_DWORD *)v36 + 3) = 0;
          begin = v10->_unmappedIndexes.__begin_;
          v37 = v10->_unmappedIndexes.__end_;
          v39 = (_CRLWPCharIndexAndAffinity *)v36;
          if (v37 != begin)
          {
            do
            {
              *((_OWORD *)v39 - 1) = *((_OWORD *)v37 - 1);
              v39 = (_CRLWPCharIndexAndAffinity *)((char *)v39 - 16);
              v37 = (_CRLWPCharIndexAndAffinity *)((char *)v37 - 16);
            }
            while (v37 != begin);
            v37 = p_unmappedIndexes->__begin_;
          }
          v30 = (_CRLWPCharIndexAndAffinity *)(v36 + 16);
          v10->_unmappedIndexes.__begin_ = v39;
          v10->_unmappedIndexes.__end_ = (_CRLWPCharIndexAndAffinity *)(v36 + 16);
          v10->_unmappedIndexes.__end_cap_.__value_ = (_CRLWPCharIndexAndAffinity *)&v35[16 * v34];
          if (v37) {
            operator delete(v37);
          }
        }
        else
        {
          *(void *)end = v16;
          v30 = (_CRLWPCharIndexAndAffinity *)((char *)end + 16);
          *((_DWORD *)end + 2) = a5;
          *((_DWORD *)end + 3) = 0;
        }
        v10->_unmappedIndexes.__end_ = v30;
        NSUInteger v40 = v16 - v10->_subRange.location + v14;
        v41 = v10->_mappedIndexes.__end_;
        v42 = v10->_mappedIndexes.__end_cap_.__value_;
        if (v41 >= v42)
        {
          uint64_t v44 = (v41 - p_mappedIndexes->__begin_) >> 4;
          unint64_t v45 = v44 + 1;
          if ((unint64_t)(v44 + 1) >> 60) {
            sub_100004E40();
          }
          uint64_t v46 = v42 - p_mappedIndexes->__begin_;
          if (v46 >> 3 > v45) {
            unint64_t v45 = v46 >> 3;
          }
          if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v45;
          }
          if (v47) {
            v48 = (char *)sub_10001EAB0((uint64_t)&v10->_mappedIndexes.__end_cap_, v47);
          }
          else {
            v48 = 0;
          }
          v49 = &v48[16 * v44];
          *(void *)v49 = v40;
          *((_DWORD *)v49 + 2) = a5;
          *((_DWORD *)v49 + 3) = 0;
          v51 = v10->_mappedIndexes.__begin_;
          v50 = v10->_mappedIndexes.__end_;
          v52 = (_CRLWPCharIndexAndAffinity *)v49;
          if (v50 != v51)
          {
            do
            {
              *((_OWORD *)v52 - 1) = *((_OWORD *)v50 - 1);
              v52 = (_CRLWPCharIndexAndAffinity *)((char *)v52 - 16);
              v50 = (_CRLWPCharIndexAndAffinity *)((char *)v50 - 16);
            }
            while (v50 != v51);
            v50 = p_mappedIndexes->__begin_;
          }
          v43 = (_CRLWPCharIndexAndAffinity *)(v49 + 16);
          v10->_mappedIndexes.__begin_ = v52;
          v10->_mappedIndexes.__end_ = (_CRLWPCharIndexAndAffinity *)(v49 + 16);
          v10->_mappedIndexes.__end_cap_.__value_ = (_CRLWPCharIndexAndAffinity *)&v48[16 * v47];
          if (v50) {
            operator delete(v50);
          }
        }
        else
        {
          *(void *)v41 = v40;
          v43 = (_CRLWPCharIndexAndAffinity *)((char *)v41 + 16);
          *((_DWORD *)v41 + 2) = a5;
          *((_DWORD *)v41 + 3) = 0;
        }
        v10->_mappedIndexes.__end_ = v43;
        ++v14;
      }
      while (v14 != v15);
    }
  }
  return v10;
}

- (unint64_t)mappedCharIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAE48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099F90();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAE68);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap mappedCharIndex:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:98 isFatal:0 description:"shouldn't be trying to map NSNotFound"];
  }
  id v8 = [(CRLWPRangeMap *)self subRange];
  [(CRLWPRangeMap *)self subRange];
  if (a3 - (unint64_t)v8 > v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  if (end != begin)
  {
    unint64_t v13 = (end - begin) >> 4;
    end = self->_unmappedIndexes.__begin_;
    do
    {
      unint64_t v14 = v13 >> 1;
      uint64_t v15 = (unint64_t *)((char *)end + 16 * (v13 >> 1));
      unint64_t v17 = *v15;
      unint64_t v16 = (_CRLWPCharIndexAndAffinity *)(v15 + 2);
      v13 += ~(v13 >> 1);
      if (v17 > a3) {
        unint64_t v13 = v14;
      }
      else {
        end = v16;
      }
    }
    while (v13);
  }
  return a3 - (void)[(CRLWPRangeMap *)self subRange] + ((end - begin) >> 4);
}

- (unint64_t)unmappedCharIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAE88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A0A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAEA8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap unmappedCharIndex:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:114 isFatal:0 description:"shouldn't be trying to map NSNotFound"];
  }
  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  if (end == begin)
  {
    uint64_t v11 = self->_mappedIndexes.__end_;
  }
  else
  {
    unint64_t v10 = (end - begin) >> 4;
    uint64_t v11 = self->_mappedIndexes.__begin_;
    do
    {
      unint64_t v12 = v10 >> 1;
      unint64_t v13 = (void *)((char *)v11 + 16 * (v10 >> 1));
      unint64_t v15 = *v13;
      unint64_t v14 = (_CRLWPCharIndexAndAffinity *)(v13 + 2);
      v10 += ~(v10 >> 1);
      if (v15 < v3) {
        uint64_t v11 = v14;
      }
      else {
        unint64_t v10 = v12;
      }
    }
    while (v10);
  }
  if (end == v11 || *(void *)v11 != v3) {
    return (unint64_t)[(CRLWPRangeMap *)self subRange] + v3 - ((v11 - begin) >> 4);
  }
  int v16 = *((_DWORD *)v11 + 2);
  if (v16 == 2)
  {
    ++v3;
  }
  else if (v16 == 1)
  {
    --v3;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAEC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109A018();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAEE8);
    }
    NSUInteger v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    BOOL v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap unmappedCharIndex:]");
    NSUInteger v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:131 isFatal:0 description:"bad affinity"];
  }
  return [(CRLWPRangeMap *)self unmappedCharIndex:v3];
}

- (unint64_t)p_extendLeftMappedIndex:(unint64_t)a3
{
  if (a3)
  {
    begin = self->_mappedIndexes.__begin_;
    end = self->_mappedIndexes.__end_;
    unint64_t v5 = a3 - 1;
    if (end != begin)
    {
      unint64_t v6 = (end - begin) >> 4;
      do
      {
        unint64_t v7 = v6 >> 1;
        id v8 = (void *)((char *)begin + 16 * (v6 >> 1));
        unint64_t v10 = *v8;
        unint64_t v9 = (_CRLWPCharIndexAndAffinity *)(v8 + 2);
        v6 += ~(v6 >> 1);
        if (v10 < v5) {
          begin = v9;
        }
        else {
          unint64_t v6 = v7;
        }
      }
      while (v6);
    }
    if (begin != end && *(void *)begin == v5 && *((_DWORD *)begin + 2) == 2) {
      --a3;
    }
  }
  return a3;
}

- (unint64_t)p_extendRightMappedIndex:(unint64_t)a3
{
  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  unint64_t v5 = a3 + 1;
  if (end != begin)
  {
    unint64_t v6 = (end - begin) >> 4;
    do
    {
      unint64_t v7 = v6 >> 1;
      id v8 = (void *)((char *)begin + 16 * (v6 >> 1));
      unint64_t v10 = *v8;
      unint64_t v9 = (_CRLWPCharIndexAndAffinity *)(v8 + 2);
      v6 += ~(v6 >> 1);
      if (v10 < v5) {
        begin = v9;
      }
      else {
        unint64_t v6 = v7;
      }
    }
    while (v6);
  }
  if (begin != end && *(void *)begin == v5 && *((_DWORD *)begin + 2) == 1) {
    ++a3;
  }
  return a3;
}

- (_NSRange)mappedCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  unint64_t location = a3.location;
  v44.unint64_t location = (NSUInteger)[(CRLWPRangeMap *)self subRange];
  v44.NSUInteger length = v6;
  v38.unint64_t location = location;
  v38.NSUInteger length = length;
  if (NSIntersectionRange(v38, v44).length)
  {
    id v7 = [(CRLWPRangeMap *)self subRange];
    if (location <= (unint64_t)v7) {
      id v8 = v7;
    }
    else {
      id v8 = (id)location;
    }
    NSUInteger v9 = [(CRLWPRangeMap *)self p_extendLeftMappedIndex:[(CRLWPRangeMap *)self mappedCharIndex:v8]];
    unint64_t v10 = (char *)[(CRLWPRangeMap *)self subRange];
    unint64_t v12 = &v10[v11];
    if ((unint64_t)&v10[v11] >= location + length) {
      unint64_t v12 = (char *)(location + length);
    }
    unint64_t v13 = (char *)[(CRLWPRangeMap *)self p_extendRightMappedIndex:[(CRLWPRangeMap *)self mappedCharIndex:v12 - 1]]- v9+ 1;
  }
  else if (location >= (unint64_t)[(CRLWPRangeMap *)self subRange])
  {
    [(CRLWPRangeMap *)self subRange];
    unint64_t v13 = 0;
    NSUInteger v9 = v14 + ((self->_mappedIndexes.__end_ - self->_mappedIndexes.__begin_) >> 4);
  }
  else
  {
    NSUInteger v9 = 0;
    unint64_t v13 = 0;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAF08);
    }
    int v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      v41.unint64_t location = location;
      v41.NSUInteger length = length;
      v25 = NSStringFromRange(v41);
      v42.unint64_t location = v9;
      v42.NSUInteger length = (NSUInteger)v13;
      NSStringFromRange(v42);
      *(_DWORD *)buf = 67110402;
      unsigned int v27 = v15;
      __int16 v28 = 2082;
      v29 = "-[CRLWPRangeMap mappedCharRange:]";
      __int16 v30 = 2082;
      uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm";
      __int16 v32 = 1024;
      int v33 = 191;
      __int16 v34 = 2114;
      v35 = v25;
      v37 = __int16 v36 = 2114;
      v24 = (void *)v37;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad range mapping: %{public}@ -> %{public}@", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAF28);
    }
    unint64_t v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap mappedCharRange:]");
    BOOL v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"];
    v39.unint64_t location = location;
    v39.NSUInteger length = length;
    NSUInteger v20 = NSStringFromRange(v39);
    v40.unint64_t location = v9;
    v40.NSUInteger length = (NSUInteger)v13;
    v21 = NSStringFromRange(v40);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 191, 0, "Bad range mapping: %{public}@ -> %{public}@", v20, v21);
  }
  if ((unint64_t)v13 <= 0x7FFFFFFFFFFFFFFELL) {
    NSUInteger v22 = v9;
  }
  else {
    NSUInteger v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((unint64_t)v13 <= 0x7FFFFFFFFFFFFFFELL) {
    NSUInteger v23 = (NSUInteger)v13;
  }
  else {
    NSUInteger v23 = 0;
  }
  result.NSUInteger length = v23;
  result.unint64_t location = v22;
  return result;
}

- (_NSRange)unmappedCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[CRLWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:");
  NSUInteger v7 = v6;
  if (length) {
    id v8 = (char *)[(CRLWPRangeMap *)self unmappedCharIndex:length + location - 1] + 1;
  }
  else {
    id v8 = (char *)v6;
  }
  if (v7 <= (unint64_t)v8) {
    NSUInteger v9 = v8;
  }
  else {
    NSUInteger v9 = (char *)v7;
  }
  if (v7 >= (unint64_t)v8) {
    NSUInteger v10 = (NSUInteger)v8;
  }
  else {
    NSUInteger v10 = v7;
  }
  NSUInteger v11 = (NSUInteger)&v9[-v10];
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (void)adjustByDelta:(int64_t)a3 startingAt:(unint64_t)a4
{
  if ((unint64_t)[(CRLWPRangeMap *)self subRange] >= a4) {
    self->_subRange.location += a3;
  }
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  while (begin != end)
  {
    if (*(void *)begin >= a4) {
      *(void *)begin += a3;
    }
    begin = (_CRLWPCharIndexAndAffinity *)((char *)begin + 16);
  }
}

- (_NSRange)subRange
{
  NSUInteger length = self->_subRange.length;
  NSUInteger location = self->_subRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSubRange:(_NSRange)a3
{
  self->_subRange = a3;
}

- (vector<_CRLWPCharIndexAndAffinity,)unmappedIndexes
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_CRLWPCharIndexAndAffinity, std::allocator<_CRLWPCharIndexAndAffinity>> *)sub_1002D9A5C(retstr, self->_unmappedIndexes.__begin_, (uint64_t)self->_unmappedIndexes.__end_, (self->_unmappedIndexes.__end_- self->_unmappedIndexes.__begin_) >> 4);
}

- (void)setUnmappedIndexes:()vector<_CRLWPCharIndexAndAffinity
{
  p_unmappedIndexes = (char *)&self->_unmappedIndexes;
  if (p_unmappedIndexes != (char *)a3) {
    sub_10001EAE8(p_unmappedIndexes, (char *)a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 4);
  }
}

- (vector<_CRLWPCharIndexAndAffinity,)mappedIndexes
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_CRLWPCharIndexAndAffinity, std::allocator<_CRLWPCharIndexAndAffinity>> *)sub_1002D9A5C(retstr, self->_mappedIndexes.__begin_, (uint64_t)self->_mappedIndexes.__end_, (self->_mappedIndexes.__end_- self->_mappedIndexes.__begin_) >> 4);
}

- (void)setMappedIndexes:()vector<_CRLWPCharIndexAndAffinity
{
  p_mappedIndexes = (char *)&self->_mappedIndexes;
  if (p_mappedIndexes != (char *)a3) {
    sub_10001EAE8(p_mappedIndexes, (char *)a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 4);
  }
}

- (void).cxx_destruct
{
  begin = self->_mappedIndexes.__begin_;
  if (begin)
  {
    self->_mappedIndexes.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_unmappedIndexes.__begin_;
  if (v4)
  {
    self->_unmappedIndexes.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end