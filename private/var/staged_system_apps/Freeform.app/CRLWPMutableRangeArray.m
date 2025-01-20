@interface CRLWPMutableRangeArray
- (_NSRange)replacedTextAtRange:(_NSRange)a3 delta:(int64_t)a4;
- (void)addRange:(_NSRange)a3;
- (void)clear;
- (void)concatenateRange:(_NSRange)a3;
- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4;
- (void)removeRange:(_NSRange)a3;
- (void)removeRangesInRange:(_NSRange)a3;
- (void)replaceRangeAtIndex:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)subtract:(id)a3;
- (void)unionWith:(id)a3;
@end

@implementation CRLWPMutableRangeArray

- (void)clear
{
  self->super._rangeVector.__end_ = self->super._rangeVector.__begin_;
}

- (void)removeRangesInRange:(_NSRange)a3
{
  if (a3.length)
  {
    begin = self->super._rangeVector.__begin_;
    end = self->super._rangeVector.__end_;
    v6 = &begin[a3.location];
    v7 = &begin[a3.location + a3.length];
    int64_t v8 = (char *)end - (char *)v7;
    if (end != v7) {
      memmove(&begin[a3.location], v7, (char *)end - (char *)v7);
    }
    self->super._rangeVector.__end_ = (_NSRange *)((char *)v6 + v8);
  }
}

- (void)concatenateRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  p_end_cap = &self->super._rangeVector.__end_cap_;
  value = self->super._rangeVector.__end_cap_.__value_;
  end = self->super._rangeVector.__end_;
  if (end >= value)
  {
    p_rangeVector = &self->super._rangeVector;
    begin = self->super._rangeVector.__begin_;
    uint64_t v12 = end - begin;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60) {
      sub_100004E40();
    }
    uint64_t v14 = (char *)value - (char *)begin;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      v16 = (char *)sub_10001EAB0((uint64_t)p_end_cap, v15);
      begin = self->super._rangeVector.__begin_;
      end = self->super._rangeVector.__end_;
    }
    else
    {
      v16 = 0;
    }
    v17 = (_NSRange *)&v16[16 * v12];
    v18 = (_NSRange *)&v16[16 * v15];
    v17->NSUInteger location = location;
    v17->NSUInteger length = length;
    v9 = v17 + 1;
    if (end != begin)
    {
      do
      {
        v17[-1] = end[-1];
        --v17;
        --end;
      }
      while (end != begin);
      begin = p_rangeVector->__begin_;
    }
    self->super._rangeVector.__begin_ = v17;
    self->super._rangeVector.__end_ = v9;
    self->super._rangeVector.__end_cap_.__value_ = v18;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    _NSRange *end = a3;
    v9 = end + 1;
  }
  self->super._rangeVector.__end_ = v9;
}

- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  _NSRange v4 = a3;
  sub_10001E428((uint64_t)&self->super._rangeVector, (char *)&self->super._rangeVector.__begin_[a4], (char *)&v4);
}

- (void)addRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(CRLWPRangeArray *)self rangeCount])
  {
    if (!length) {
      return;
    }
    v55.NSUInteger location = location;
    v55.NSUInteger length = length;
    begin = self->super._rangeVector.__begin_;
    end = (char *)self->super._rangeVector.__end_;
    p_rangeVector = &self->super._rangeVector;
    if (end == (char *)begin)
    {
      LODWORD(v15) = 0;
      v17 = self->super._rangeVector.__begin_;
      NSUInteger v22 = length;
      NSUInteger v23 = location;
    }
    else
    {
      unint64_t v9 = (end - (char *)begin) >> 4;
      v10 = self->super._rangeVector.__begin_;
      do
      {
        unint64_t v11 = v9 >> 1;
        uint64_t v12 = &v10[v9 >> 1];
        NSUInteger v14 = v12->location;
        unint64_t v13 = v12 + 1;
        v9 += ~(v9 >> 1);
        if (v14 < location) {
          v10 = v13;
        }
        else {
          unint64_t v9 = v11;
        }
      }
      while (v9);
      uint64_t v15 = end - (char *)v10;
      if (end == (char *)v10)
      {
        NSUInteger v22 = length;
        NSUInteger v23 = location;
        v17 = self->super._rangeVector.__end_;
        v10 = v17;
      }
      else
      {
        unint64_t v16 = v15 >> 4;
        v17 = v10;
        do
        {
          unint64_t v18 = v16 >> 1;
          v19 = &v17[v16 >> 1];
          NSUInteger v21 = v19->location;
          v20 = v19 + 1;
          v16 += ~(v16 >> 1);
          if (v21 < location + length) {
            v17 = v20;
          }
          else {
            unint64_t v16 = v18;
          }
        }
        while (v16);
        v57.NSUInteger location = location;
        v57.NSUInteger length = length;
        if (sub_1002093DC(v57, *v10, 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          LODWORD(v15) = 0;
          NSUInteger v22 = length;
          NSUInteger v23 = location;
        }
        else
        {
          v58.NSUInteger location = location;
          v58.NSUInteger length = length;
          NSRange v33 = NSUnionRange(v58, *v10);
          NSUInteger v23 = v33.location;
          NSUInteger v22 = v33.length;
          NSRange v55 = v33;
          LODWORD(v15) = 1;
        }
      }
      if (v10 != begin)
      {
        int v54 = v15;
        v59.NSUInteger location = v23;
        v59.NSUInteger length = v22;
        if (sub_1002093DC(v59, v10[-1], 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          p_rangeVector = &self->super._rangeVector;
          LODWORD(v15) = v54;
        }
        else
        {
          v60.NSUInteger location = v23;
          v60.NSUInteger length = v22;
          NSRange v34 = NSUnionRange(v60, v10[-1]);
          NSUInteger v23 = v34.location;
          NSUInteger v22 = v34.length;
          NSRange v55 = v34;
          LODWORD(v15) = 1;
          --v10;
          p_rangeVector = &self->super._rangeVector;
        }
        goto LABEL_36;
      }
    }
    v10 = begin;
LABEL_36:
    uint64_t v36 = v17 == (_NSRange *)end && v17 != begin;
    v37 = &v17[v36 << 63 >> 63];
    if (v37 == (NSRange *)end
      || (v61.NSUInteger location = v23,
          v61.NSUInteger length = v22,
          int v38 = v15,
          NSUInteger v39 = sub_1002093DC(v61, *v37, 1),
          LODWORD(v15) = v38,
          v39 == 0x7FFFFFFFFFFFFFFFLL))
    {
      if (!v15) {
        goto LABEL_66;
      }
    }
    else
    {
      NSRange v63 = *v37++;
      v62.NSUInteger location = v23;
      v62.NSUInteger length = v22;
      NSRange v55 = NSUnionRange(v62, v63);
    }
    if (v10 >= v37)
    {
      if (v37 < v10)
      {
        v44 = self->super._rangeVector.__end_;
        size_t v41 = (char *)v44 - (char *)v10;
        if (v44 != v10) {
          memmove(v37, v10, (char *)v44 - (char *)v10);
        }
        v10 = v37;
        goto LABEL_65;
      }
      if (v10 == (_NSRange *)end) {
        goto LABEL_67;
      }
      v43 = v10 + 1;
      v47 = self->super._rangeVector.__end_;
      size_t v41 = (char *)v47 - (char *)&v10[1];
      if (v47 == &v10[1]) {
        goto LABEL_65;
      }
      v42 = v10;
    }
    else
    {
      v40 = self->super._rangeVector.__end_;
      size_t v41 = (char *)v40 - (char *)v37;
      if (v40 == v37)
      {
LABEL_65:
        self->super._rangeVector.__end_ = (_NSRange *)((char *)v10 + v41);
LABEL_66:
        end = (char *)v10;
LABEL_67:
        sub_10001E428((uint64_t)p_rangeVector, end, (char *)&v55);
        if (!-[CRLWPRangeArray containsRange:](self, "containsRange:", location, length))
        {
          int v48 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FD000);
          }
          v49 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010B8114(v48, v49);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FD020);
          }
          v50 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
          {
            v51 = +[CRLAssertionHandler packedBacktraceString];
            sub_10106CDAC(v51, buf, v48, (os_log_t)v50);
          }

          v52 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPMutableRangeArray addRange:]");
          v53 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeArray.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v52 file:v53 lineNumber:438 isFatal:0 description:"addRange failure"];
        }
        return;
      }
      v42 = v10;
      v43 = v37;
    }
    memmove(v42, v43, v41);
    goto LABEL_65;
  }
  value = self->super._rangeVector.__end_cap_.__value_;
  v25 = self->super._rangeVector.__end_;
  if (v25 >= value)
  {
    v27 = self->super._rangeVector.__begin_;
    uint64_t v28 = v25 - v27;
    unint64_t v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 60) {
      sub_100004E40();
    }
    uint64_t v30 = (char *)value - (char *)v27;
    if (v30 >> 3 > v29) {
      unint64_t v29 = v30 >> 3;
    }
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v31 = v29;
    }
    if (v31)
    {
      v32 = (char *)sub_10001EAB0((uint64_t)&self->super._rangeVector.__end_cap_, v31);
      v27 = self->super._rangeVector.__begin_;
      v25 = self->super._rangeVector.__end_;
    }
    else
    {
      v32 = 0;
    }
    v45 = (_NSRange *)&v32[16 * v28];
    v46 = (_NSRange *)&v32[16 * v31];
    v45->NSUInteger location = location;
    v45->NSUInteger length = length;
    v26 = v45 + 1;
    if (v25 != v27)
    {
      do
      {
        v45[-1] = v25[-1];
        --v45;
        --v25;
      }
      while (v25 != v27);
      v27 = self->super._rangeVector.__begin_;
    }
    self->super._rangeVector.__begin_ = v45;
    self->super._rangeVector.__end_ = v26;
    self->super._rangeVector.__end_cap_.__value_ = v46;
    if (v27) {
      operator delete(v27);
    }
  }
  else
  {
    v25->NSUInteger location = location;
    v25->NSUInteger length = length;
    v26 = v25 + 1;
  }
  self->super._rangeVector.__end_ = v26;
}

- (void)removeRange:(_NSRange)a3
{
  if (!a3.length) {
    return;
  }
  begin = self->super._rangeVector.__begin_;
  end = self->super._rangeVector.__end_;
  p_rangeVector = &self->super._rangeVector;
  uint64_t v7 = (char *)end - (char *)begin;
  if (end == begin)
  {
    NSUInteger v15 = a3.location + a3.length;
    unint64_t v16 = begin;
  }
  else
  {
    unint64_t v8 = v7 >> 4;
    unint64_t v9 = v7 >> 4;
    v10 = (char *)begin;
    do
    {
      unint64_t v11 = v9 >> 1;
      uint64_t v12 = (NSUInteger *)&v10[16 * (v9 >> 1)];
      NSUInteger v14 = *v12;
      unint64_t v13 = (char *)(v12 + 2);
      v9 += ~(v9 >> 1);
      if (v14 > a3.location) {
        unint64_t v9 = v11;
      }
      else {
        v10 = v13;
      }
    }
    while (v9);
    NSUInteger v15 = a3.location + a3.length;
    unint64_t v16 = begin;
    do
    {
      unint64_t v17 = v8 >> 1;
      unint64_t v18 = &v16[v8 >> 1];
      NSUInteger location = v18->location;
      v19 = v18 + 1;
      v8 += ~(v8 >> 1);
      if (location < v15) {
        unint64_t v16 = v19;
      }
      else {
        unint64_t v8 = v17;
      }
    }
    while (v8);
    if (v10 != (char *)begin)
    {
      begin = (_NSRange *)(v10 - 16);
      unint64_t v21 = *((void *)v10 - 2);
      NSUInteger v22 = a3.location - v21;
      if (a3.location < v21 || (NSUInteger v23 = *((void *)v10 - 1), v22 >= v23))
      {
        begin = (_NSRange *)v10;
      }
      else
      {
        if (a3.location != v21)
        {
          *((void *)v10 - 1) = v22;
          begin = (_NSRange *)v10;
        }
        if (v15 >= v21 && v15 - v21 < v23)
        {
          NSUInteger v24 = v23 + v21;
          BOOL v25 = v15 >= v23 + v21;
          if (v15 <= v23 + v21) {
            NSUInteger v26 = v23 + v21;
          }
          else {
            NSUInteger v26 = a3.location + a3.length;
          }
          if (!v25) {
            NSUInteger v24 = a3.location + a3.length;
          }
          v37.NSUInteger location = v24;
          v37.NSUInteger length = v26 - v24;
          if (a3.location == v21) {
            _NSRange *begin = v37;
          }
          else {
            sub_10001E428((uint64_t)p_rangeVector, v10, (char *)&v37);
          }
          return;
        }
      }
    }
  }
  if (v16 != end)
  {
    NSUInteger length = v16->length;
    if (v15 > v16->location && v15 - v16->location < length)
    {
      NSUInteger v29 = length + v16->location;
      if (v15 <= v29) {
        NSUInteger v30 = length + v16->location;
      }
      else {
        NSUInteger v30 = v15;
      }
      if (v15 < v29) {
        NSUInteger v29 = v15;
      }
      v16->NSUInteger location = v29;
      v16->NSUInteger length = v30 - v29;
    }
  }
  if (begin != v16)
  {
    NSUInteger v31 = v16[-1].location;
    NSUInteger v32 = v16[-1].length;
    if (v15 >= v31 && v15 - v31 < v32)
    {
      NSUInteger v34 = v32 + v31;
      if (v15 <= v34) {
        NSUInteger v35 = v34;
      }
      else {
        NSUInteger v35 = v15;
      }
      if (v15 >= v34) {
        NSUInteger v15 = v34;
      }
      v16[-1].NSUInteger location = v15;
      v16[-1].NSUInteger length = v35 - v15;
      --v16;
    }
    if (begin != v16)
    {
      int64_t v36 = (char *)end - (char *)v16;
      if (end != v16) {
        memmove(begin, v16, (char *)end - (char *)v16);
      }
      self->super._rangeVector.__end_ = (_NSRange *)((char *)begin + v36);
    }
  }
}

- (void)replaceRangeAtIndex:(unint64_t)a3 withRange:(_NSRange)a4
{
  self->super._rangeVector.__begin_[a3] = a4;
}

- (_NSRange)replacedTextAtRange:(_NSRange)a3 delta:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v8 = [(CRLWPRangeArray *)self rangeCount];
  if (v8)
  {
    unint64_t v9 = v8;
    unint64_t v10 = 0;
    NSUInteger v11 = length - a4 + location;
    unint64_t v41 = -a4;
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v14 = a4;
    int64_t v42 = a4;
    while (1)
    {
      begin = self->super._rangeVector.__begin_;
      unint64_t v16 = &begin[v10];
      NSUInteger v18 = v16->location;
      NSUInteger v17 = v16->length;
      NSUInteger v19 = v17 + v16->location;
      if (v19 >= location)
      {
        if (location <= v18)
        {
          if (v11 >= v19)
          {
            end = self->super._rangeVector.__end_;
            int64_t v26 = (char *)end - (char *)&v16[1];
            if (end != &v16[1])
            {
              unint64_t v27 = v12;
              unint64_t v28 = v13;
              memmove(v16, &v16[1], (char *)end - (char *)&v16[1]);
              unint64_t v13 = v28;
              unint64_t v12 = v27;
              int64_t v14 = v42;
            }
            self->super._rangeVector.__end_ = (_NSRange *)((char *)v16 + v26);
            --v9;
            if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v13 = v10 + 1;
            }
            else {
              ++v13;
            }
            if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v12 = v10;
            }
            goto LABEL_44;
          }
          if (v11 <= v18)
          {
            if (v14 < 0 && v18 < v41)
            {
              unint64_t v39 = v13;
              unint64_t v40 = v12;
              unsigned int v29 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FD040);
              }
              NSUInteger v30 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                unsigned int v44 = v29;
                __int16 v45 = 2082;
                v46 = "-[CRLWPMutableRangeArray replacedTextAtRange:delta:]";
                __int16 v47 = 2082;
                int v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeArray.mm";
                __int16 v49 = 1024;
                int v50 = 536;
                _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad location", buf, 0x22u);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014FD060);
              }
              NSUInteger v31 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
              {
                NSUInteger v35 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                unsigned int v44 = v29;
                __int16 v45 = 2114;
                v46 = v35;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              NSUInteger v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPMutableRangeArray replacedTextAtRange:delta:]");
              NSRange v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeArray.mm"];
              +[CRLAssertionHandler handleFailureInFunction:v32 file:v33 lineNumber:536 isFatal:0 description:"bad location"];

              begin = self->super._rangeVector.__begin_;
              int64_t v14 = v42;
              unint64_t v13 = v39;
              unint64_t v12 = v40;
            }
            NSUInteger v21 = v18 + v14;
          }
          else
          {
            NSUInteger v21 = v19 + v14;
            if (location <= v21) {
              NSUInteger v22 = v21;
            }
            else {
              NSUInteger v22 = location;
            }
            if (location < v21) {
              NSUInteger v21 = location;
            }
            NSUInteger v17 = v22 - v21;
          }
          NSUInteger v34 = &begin[v10];
          v34->NSUInteger location = v21;
          v34->NSUInteger length = v17;
        }
        else
        {
          if (v11 >= v19)
          {
            if (v18 <= location) {
              NSUInteger v23 = location;
            }
            else {
              NSUInteger v23 = v16->location;
            }
            if (v18 >= location) {
              NSUInteger v24 = location;
            }
            else {
              NSUInteger v24 = v16->location;
            }
            NSUInteger v20 = v23 - v24;
            v16->NSUInteger location = v24;
          }
          else
          {
            NSUInteger v20 = v17 + v14;
          }
          v16->NSUInteger length = v20;
        }
      }
      ++v10;
LABEL_44:
      if (v10 >= v9) {
        goto LABEL_47;
      }
    }
  }
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_47:
  if (v12 <= v13) {
    unint64_t v36 = v13;
  }
  else {
    unint64_t v36 = v12;
  }
  if (v12 >= v13) {
    NSUInteger v37 = v13;
  }
  else {
    NSUInteger v37 = v12;
  }
  NSUInteger v38 = v36 - v37;
  result.NSUInteger length = v38;
  result.NSUInteger location = v37;
  return result;
}

- (void)unionWith:(id)a3
{
  id v8 = a3;
  _NSRange v4 = (char *)[v8 rangeCount];
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      id v6 = [v8 rangeAtIndex:i];
      -[CRLWPMutableRangeArray addRange:](self, "addRange:", v6, v7);
    }
  }
}

- (void)subtract:(id)a3
{
  id v8 = a3;
  if ([(CRLWPRangeArray *)self rangeCount])
  {
    _NSRange v4 = (char *)[v8 rangeCount];
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        id v6 = [v8 rangeAtIndex:i];
        -[CRLWPMutableRangeArray removeRange:](self, "removeRange:", v6, v7);
      }
    }
  }
}

@end