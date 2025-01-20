@interface CRLBezierPathBooleanOperationInputPathMap
- (id).cxx_construct;
- (id)copyWithElementsInRange:(_NSRange)a3;
- (id)description;
- (int64_t)elementCount;
- (int64_t)inputPathIndexForOutputElementIndex:(int64_t)a3 outInputT:(double *)a4;
@end

@implementation CRLBezierPathBooleanOperationInputPathMap

- (int64_t)elementCount
{
  return ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
}

- (id)copyWithElementsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap);
  v7 = v6;
  if (v6 != self)
  {
    v6->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__p3_.__value_ = self->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__p3_.__value_;
    sub_1003637A0(&v6->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__bucket_list_.__ptr_.__value_, (void *)self->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__p1_.__value_.__next_, 0);
  }
  if (length)
  {
    begin = (long long *)self->_points.__begin_;
    uint64_t v9 = (char *)self->_points.__end_ - (char *)begin;
    if (location >= v9 >> 4)
    {
      unsigned int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0970);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        int64_t v15 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v13;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]";
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm";
        __int16 v42 = 1024;
        int v43 = 703;
        __int16 v44 = 2048;
        NSUInteger v45 = location;
        __int16 v46 = 2048;
        int64_t v47 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Start of range (%zu) must be in bounds [0, %zu).", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0990);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      int64_t v39 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Start of range (%zu) must be in bounds [0, %zu).", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]");
      v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]");
      v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 703, 1, "Start of range (%zu) must be in bounds [0, %zu).", location, ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4, 703, location, v39);
    }
    else
    {
      NSUInteger v10 = location + length;
      if (location + length <= v9 >> 4)
      {
        memset(buf, 0, 24);
        sub_100363DD4(buf, &begin[location], &begin[v10], length);
        v11 = v7->_points.__begin_;
        if (v11)
        {
          v7->_points.__end_ = v11;
          operator delete(v11);
          v7->_points.__begin_ = 0;
          v7->_points.__end_ = 0;
          v7->_points.__end_cap_.__value_ = 0;
        }
        *(_OWORD *)&v7->_points.__begin_ = *(_OWORD *)buf;
        v7->_points.__end_cap_.__value_ = *(void **)&buf[16];
        return v7;
      }
      unsigned int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F09B0);
      }
      v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        int64_t v28 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v26;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]";
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm";
        __int16 v42 = 1024;
        int v43 = 704;
        __int16 v44 = 2048;
        NSUInteger v45 = v10;
        __int16 v46 = 2048;
        int64_t v47 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d End of range (%zu) must be in bounds [0, %zu].", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F09D0);
      }
      v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      int64_t v40 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d End of range (%zu) must be in bounds [0, %zu].", v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]");
      v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]");
      v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 704, 1, "End of range (%zu) must be in bounds [0, %zu].", v10, ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4, 704, v10, v40);
    }

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v37, v38);
    abort();
  }
  return v7;
}

- (int64_t)inputPathIndexForOutputElementIndex:(int64_t)a3 outInputT:(double *)a4
{
  begin = (char *)self->_points.__begin_;
  if (a3 >= (unint64_t)(((char *)self->_points.__end_ - (char *)begin) >> 4)) {
    sub_1001AF1A0();
  }
  v5 = (double *)&begin[16 * a3];
  unint64_t v6 = *(void *)v5;
  if (a4)
  {
    *a4 = v5[1];
    unint64_t v9 = v6;
    if (v6 == -1)
    {
      *a4 = 0.0;
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v9 = *(void *)v5;
    if (v6 == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v7 = sub_10001CDB8(&self->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__bucket_list_.__ptr_.__value_, &v9);
  if (!v7) {
    sub_10001D180("unordered_map::at: key not found");
  }
  return v7[3];
}

- (id)description
{
  v3 = +[NSMutableString string];
  [v3 appendFormat:@"CRLBezierPathBooleanOperationInputPathMap <%p>", self];
  uint64_t v4 = [(CRLBezierPathBooleanOperationInputPathMap *)self elementCount];
  uint64_t v5 = v4;
  if (v4)
  {
    if (v4 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        uint64_t v9 = 0x7FF8000000000000;
        int64_t v7 = [(CRLBezierPathBooleanOperationInputPathMap *)self inputPathIndexForOutputElementIndex:v6 outInputT:&v9];
        [v3 appendFormat:@"\n  %zu: %zu @ %f", v6++, v7, v9];
      }
      while (v5 != v6);
    }
  }
  else
  {
    [v3 appendString:@" - empty"];
  }

  return v3;
}

- (void).cxx_destruct
{
  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }

  sub_10001D134((uint64_t)&self->_BOOLeanSubpathIndexToInputBezierPathIndex);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end