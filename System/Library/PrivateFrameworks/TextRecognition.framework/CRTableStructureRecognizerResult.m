@interface CRTableStructureRecognizerResult
- (CRNormalizedQuad)tableQuad;
- (CRTableStructureRecognizerResultParsed)parsedProgram;
- (CRTableStructureRecognizerResultProgram)program;
- (id).cxx_construct;
- (vector<CGRect,)rectForCells;
- (vector<CRTableStructureColumn,)columns;
- (vector<CRTableStructureMerge,)merges;
- (vector<CRTableStructureRow,)rows;
- (vector<_NSRange,)columnsForCells;
- (vector<_NSRange,)rowsForCells;
- (vector<std::vector<unsigned)textLineIndexesForCells;
- (void)setColumns:()vector<CRTableStructureColumn;
- (void)setColumnsForCells:()vector<_NSRange;
- (void)setMerges:()vector<CRTableStructureMerge;
- (void)setParsedProgram:(CRTableStructureRecognizerResultParsed *)a3;
- (void)setProgram:(id)a3;
- (void)setRectForCells:()vector<CGRect;
- (void)setRows:()vector<CRTableStructureRow;
- (void)setRowsForCells:()vector<_NSRange;
- (void)setTableQuad:(id)a3;
- (void)setTextLineIndexesForCells:(vector<std:(std::allocator<std::vector<unsigned long>>> *)a3 :vector<unsigned)long>;
@end

@implementation CRTableStructureRecognizerResult

- (vector<CRTableStructureRow,)rows
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[1].__begin_;
  end = self[1].__end_;
  int64_t v6 = end - begin;
  if (end != begin)
  {
    std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](retstr, v6 >> 5);
    v7 = retstr->__end_;
    self = (vector<CRTableStructureRow, std::allocator<CRTableStructureRow>> *)memmove(v7, begin, v6);
    retstr->__end_ = (CRTableStructureRow *)((char *)v7 + 32 * (v6 >> 5));
  }
  return self;
}

- (void)setRows:()vector<CRTableStructureRow
{
  p_rows = &self->_rows;
  if (&self->_rows != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    int64_t v7 = end - a3->__begin_;
    unint64_t v8 = v7 >> 5;
    uint64_t value = (uint64_t)self->_rows.__end_cap_.__value_;
    v10 = self->_rows.__begin_;
    if (v7 >> 5 <= (unint64_t)((value - (uint64_t)v10) >> 5))
    {
      p_end = &self->_rows.__end_;
      v15 = self->_rows.__end_;
      unint64_t v16 = (v15 - v10) >> 5;
      if (v16 < v8)
      {
        v17 = (CRTableStructureRow *)((char *)begin + 32 * v16);
        if (v15 != v10)
        {
          memmove(self->_rows.__begin_, begin, v15 - v10);
          v10 = *p_end;
        }
        int64_t v7 = end - v17;
        if (end == v17) {
          goto LABEL_20;
        }
        v18 = v10;
        v19 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        self->_rows.__end_ = v10;
        operator delete(v10);
        uint64_t value = 0;
        p_rows->__begin_ = 0;
        p_rows->__end_ = 0;
        p_rows->__end_cap_.__value_ = 0;
      }
      if (v7 < 0) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = value >> 4;
      if (value >> 4 <= v8) {
        uint64_t v11 = v7 >> 5;
      }
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](p_rows, v12);
      v14 = self->_rows.__end_;
      p_end = &self->_rows.__end_;
      v10 = v14;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (CRTableStructureRow *)((char *)v10 + v7);
      return;
    }
    v18 = v10;
    v19 = begin;
LABEL_19:
    memmove(v18, v19, v7);
    goto LABEL_20;
  }
}

- (vector<CRTableStructureColumn,)columns
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[2].__begin_;
  end = self[2].__end_;
  int64_t v6 = end - begin;
  if (end != begin)
  {
    std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](retstr, v6 >> 5);
    int64_t v7 = retstr->__end_;
    self = (vector<CRTableStructureColumn, std::allocator<CRTableStructureColumn>> *)memmove(v7, begin, v6);
    retstr->__end_ = (CRTableStructureColumn *)((char *)v7 + 32 * (v6 >> 5));
  }
  return self;
}

- (void)setColumns:()vector<CRTableStructureColumn
{
  p_columns = &self->_columns;
  if (&self->_columns != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    int64_t v7 = end - a3->__begin_;
    unint64_t v8 = v7 >> 5;
    uint64_t value = (uint64_t)self->_columns.__end_cap_.__value_;
    v10 = self->_columns.__begin_;
    if (v7 >> 5 <= (unint64_t)((value - (uint64_t)v10) >> 5))
    {
      p_end = &self->_columns.__end_;
      v15 = self->_columns.__end_;
      unint64_t v16 = (v15 - v10) >> 5;
      if (v16 < v8)
      {
        v17 = (CRTableStructureColumn *)((char *)begin + 32 * v16);
        if (v15 != v10)
        {
          memmove(self->_columns.__begin_, begin, v15 - v10);
          v10 = *p_end;
        }
        int64_t v7 = end - v17;
        if (end == v17) {
          goto LABEL_20;
        }
        v18 = v10;
        v19 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        self->_columns.__end_ = v10;
        operator delete(v10);
        uint64_t value = 0;
        p_columns->__begin_ = 0;
        p_columns->__end_ = 0;
        p_columns->__end_cap_.__value_ = 0;
      }
      if (v7 < 0) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = value >> 4;
      if (value >> 4 <= v8) {
        uint64_t v11 = v7 >> 5;
      }
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      std::vector<CRTableStructureRow>::__vallocate[abi:ne180100](p_columns, v12);
      v14 = self->_columns.__end_;
      p_end = &self->_columns.__end_;
      v10 = v14;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (CRTableStructureColumn *)((char *)v10 + v7);
      return;
    }
    v18 = v10;
    v19 = begin;
LABEL_19:
    memmove(v18, v19, v7);
    goto LABEL_20;
  }
}

- (vector<CRTableStructureMerge,)merges
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<CRTableStructureMerge, std::allocator<CRTableStructureMerge>> *)std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(retstr, self->_merges.__begin_, (uint64_t)self->_merges.__end_, (self->_merges.__end_- self->_merges.__begin_) >> 5);
}

- (void)setMerges:()vector<CRTableStructureMerge
{
  p_merges = (char *)&self->_merges;
  if (p_merges != (char *)a3) {
    std::vector<CRTableStructureMerge>::__assign_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(p_merges, (char *)a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 5);
  }
}

- (vector<std::vector<unsigned)textLineIndexesForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::vector<unsigned long>, std::allocator<std::vector<unsigned long>>> *)std::vector<std::vector<unsigned long>>::__init_with_size[abi:ne180100]<std::vector<unsigned long>*,std::vector<unsigned long>*>(retstr, (uint64_t)self->_textLineIndexesForCells.__begin_, (uint64_t)self->_textLineIndexesForCells.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_textLineIndexesForCells.__end_- (char *)self->_textLineIndexesForCells.__begin_) >> 3));
}

- (void)setTextLineIndexesForCells:(vector<std:(std::allocator<std::vector<unsigned long>>> *)a3 :vector<unsigned)long>
{
  p_textLineIndexesForCells = &self->_textLineIndexesForCells;
  if (&self->_textLineIndexesForCells != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    p_end_cap = &self->_textLineIndexesForCells.__end_cap_;
    uint64_t value = (uint64_t)self->_textLineIndexesForCells.__end_cap_.__value_;
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((int64_t)((uint64_t)end - (unint64_t)a3->__begin_) >> 3);
    v10 = (char *)self->_textLineIndexesForCells.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((value - (uint64_t)v10) >> 3) < v9)
    {
      if (v10)
      {
        std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)&self->_textLineIndexesForCells);
        operator delete(p_textLineIndexesForCells->__begin_);
        uint64_t value = 0;
        p_textLineIndexesForCells->__begin_ = 0;
        p_textLineIndexesForCells->__end_ = 0;
        p_textLineIndexesForCells->__end_cap_.__value_ = 0;
      }
      if (v9 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (value >> 3);
      uint64_t v12 = 2 * v11;
      if (2 * v11 <= v9) {
        uint64_t v12 = v9;
      }
      if (v11 >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v12;
      }
      std::vector<std::vector<unsigned long>>::__vallocate[abi:ne180100](p_textLineIndexesForCells, v13);
      v14 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<unsigned long>>,std::vector<unsigned long>*,std::vector<unsigned long>*,std::vector<unsigned long>*>((uint64_t)p_end_cap, (uint64_t)begin, (uint64_t)end, (void *)self->_textLineIndexesForCells.__end_);
      goto LABEL_14;
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_textLineIndexesForCells.__end_ - (char *)v10) >> 3) < v9)
    {
      uint64_t v15 = (uint64_t)begin + 8 * (((char *)self->_textLineIndexesForCells.__end_ - (char *)v10) >> 3);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<unsigned long> *,std::vector<unsigned long> *,std::vector<unsigned long> *>((uint64_t)begin, v15, v10);
      v14 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<unsigned long>>,std::vector<unsigned long>*,std::vector<unsigned long>*,std::vector<unsigned long>*>((uint64_t)p_end_cap, v15, (uint64_t)end, (void *)self->_textLineIndexesForCells.__end_);
LABEL_14:
      self->_textLineIndexesForCells.__end_ = v14;
      return;
    }
    unint64_t v16 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<unsigned long> *,std::vector<unsigned long> *,std::vector<unsigned long> *>((uint64_t)begin, (uint64_t)end, v10);
    v17 = (char *)self->_textLineIndexesForCells.__end_;
    if (v17 != v16)
    {
      v18 = (char *)self->_textLineIndexesForCells.__end_;
      do
      {
        v20 = (void *)*((void *)v18 - 3);
        v18 -= 24;
        v19 = v20;
        if (v20)
        {
          *((void *)v17 - 2) = v19;
          operator delete(v19);
        }
        v17 = v18;
      }
      while (v18 != v16);
    }
    self->_textLineIndexesForCells.__end_ = v16;
  }
}

- (vector<CGRect,)rectForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<CGRect, std::allocator<CGRect>> *)std::vector<CGRect>::__init_with_size[abi:ne180100]<CGRect*,CGRect*>(retstr, self->_rectForCells.__begin_, (uint64_t)self->_rectForCells.__end_, self->_rectForCells.__end_ - self->_rectForCells.__begin_);
}

- (void)setRectForCells:()vector<CGRect
{
  p_rectForCells = &self->_rectForCells;
  if (&self->_rectForCells != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    int64_t v7 = (char *)end - (char *)a3->__begin_;
    unint64_t v8 = v7 >> 5;
    uint64_t value = (uint64_t)self->_rectForCells.__end_cap_.__value_;
    v10 = self->_rectForCells.__begin_;
    if (v7 >> 5 <= (unint64_t)((value - (uint64_t)v10) >> 5))
    {
      p_end = &self->_rectForCells.__end_;
      uint64_t v15 = self->_rectForCells.__end_;
      unint64_t v16 = v15 - v10;
      if (v16 < v8)
      {
        v17 = &begin[v16];
        if (v15 != v10)
        {
          memmove(self->_rectForCells.__begin_, begin, (char *)v15 - (char *)v10);
          v10 = *p_end;
        }
        int64_t v7 = (char *)end - (char *)v17;
        if (end == v17) {
          goto LABEL_20;
        }
        v18 = v10;
        v19 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (v10)
      {
        self->_rectForCells.__end_ = v10;
        operator delete(v10);
        uint64_t value = 0;
        p_rectForCells->__begin_ = 0;
        p_rectForCells->__end_ = 0;
        p_rectForCells->__end_cap_.__value_ = 0;
      }
      if (v7 < 0) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = value >> 4;
      if (value >> 4 <= v8) {
        uint64_t v11 = v7 >> 5;
      }
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      std::vector<CGRect>::__vallocate[abi:ne180100](p_rectForCells, v12);
      v14 = self->_rectForCells.__end_;
      p_end = &self->_rectForCells.__end_;
      v10 = v14;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (CGRect *)((char *)v10 + v7);
      return;
    }
    v18 = v10;
    v19 = begin;
LABEL_19:
    memmove(v18, v19, v7);
    goto LABEL_20;
  }
}

- (vector<_NSRange,)rowsForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_NSRange, std::allocator<_NSRange>> *)std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(retstr, self->_rowsForCells.__begin_, (uint64_t)self->_rowsForCells.__end_, self->_rowsForCells.__end_ - self->_rowsForCells.__begin_);
}

- (void)setRowsForCells:()vector<_NSRange
{
  p_rowsForCells = (char *)&self->_rowsForCells;
  if (p_rowsForCells != (char *)a3) {
    std::vector<_NSRange>::__assign_with_size[abi:ne180100]<_NSRange*,_NSRange*>(p_rowsForCells, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (vector<_NSRange,)columnsForCells
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_NSRange, std::allocator<_NSRange>> *)std::vector<_NSRange>::__init_with_size[abi:ne180100]<_NSRange*,_NSRange*>(retstr, self->_columnsForCells.__begin_, (uint64_t)self->_columnsForCells.__end_, self->_columnsForCells.__end_ - self->_columnsForCells.__begin_);
}

- (void)setColumnsForCells:()vector<_NSRange
{
  p_columnsForCells = (char *)&self->_columnsForCells;
  if (p_columnsForCells != (char *)a3) {
    std::vector<_NSRange>::__assign_with_size[abi:ne180100]<_NSRange*,_NSRange*>(p_columnsForCells, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (CRNormalizedQuad)tableQuad
{
  return self->_tableQuad;
}

- (void)setTableQuad:(id)a3
{
}

- (CRTableStructureRecognizerResultProgram)program
{
  return (CRTableStructureRecognizerResultProgram *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgram:(id)a3
{
}

- (CRTableStructureRecognizerResultParsed)parsedProgram
{
  *(_OWORD *)&retstr->numRows = *(_OWORD *)&self->_parsedProgram.numRows;
  retstr->valid = self->_parsedProgram.valid;
  retstr->rowHeights.__begin_ = 0;
  retstr->rowHeights.__end_ = 0;
  retstr->rowHeights.__end_cap_.__value_ = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&retstr->rowHeights.__begin_, self->_parsedProgram.rowHeights.__begin_, (uint64_t)self->_parsedProgram.rowHeights.__end_, self->_parsedProgram.rowHeights.__end_ - self->_parsedProgram.rowHeights.__begin_);
  retstr->columnWidths.__begin_ = 0;
  retstr->columnWidths.__end_ = 0;
  retstr->columnWidths.__end_cap_.__value_ = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&retstr->columnWidths.__begin_, self->_parsedProgram.columnWidths.__begin_, (uint64_t)self->_parsedProgram.columnWidths.__end_, self->_parsedProgram.columnWidths.__end_ - self->_parsedProgram.columnWidths.__begin_);
  retstr->merges.__begin_ = 0;
  retstr->merges.__end_ = 0;
  retstr->merges.__end_cap_.__value_ = 0;
  return (CRTableStructureRecognizerResultParsed *)std::vector<CRTableStructureMerge>::__init_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>(&retstr->merges.__begin_, self->_parsedProgram.merges.__begin_, (uint64_t)self->_parsedProgram.merges.__end_, (self->_parsedProgram.merges.__end_- self->_parsedProgram.merges.__begin_) >> 5);
}

- (void)setParsedProgram:(CRTableStructureRecognizerResultParsed *)a3
{
  long long v3 = *(_OWORD *)&a3->numRows;
  self->_parsedProgram.valid = a3->valid;
  *(_OWORD *)&self->_parsedProgram.numRows = v3;
  if (&self->_parsedProgram != a3)
  {
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&self->_parsedProgram.rowHeights, (char *)a3->rowHeights.__begin_, (uint64_t)a3->rowHeights.__end_, a3->rowHeights.__end_ - a3->rowHeights.__begin_);
    std::vector<PixelPosition>::__assign_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>((char *)&self->_parsedProgram.columnWidths, (char *)a3->columnWidths.__begin_, (uint64_t)a3->columnWidths.__end_, a3->columnWidths.__end_ - a3->columnWidths.__begin_);
    begin = (char *)a3->merges.__begin_;
    end = a3->merges.__end_;
    std::vector<CRTableStructureMerge>::__assign_with_size[abi:ne180100]<CRTableStructureMerge*,CRTableStructureMerge*>((char *)&self->_parsedProgram.merges, begin, (uint64_t)end, (end - (CRTableStructureMerge *)begin) >> 5);
  }
}

- (void).cxx_destruct
{
  begin = self->_parsedProgram.merges.__begin_;
  if (begin)
  {
    self->_parsedProgram.merges.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_parsedProgram.columnWidths.__begin_;
  if (v4)
  {
    self->_parsedProgram.columnWidths.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_parsedProgram.rowHeights.__begin_;
  if (v5)
  {
    self->_parsedProgram.rowHeights.__end_ = v5;
    operator delete(v5);
  }
  int64_t v6 = self->_columnsForCells.__begin_;
  if (v6)
  {
    self->_columnsForCells.__end_ = v6;
    operator delete(v6);
  }
  int64_t v7 = self->_rowsForCells.__begin_;
  if (v7)
  {
    self->_rowsForCells.__end_ = v7;
    operator delete(v7);
  }
  unint64_t v8 = self->_rectForCells.__begin_;
  if (v8)
  {
    self->_rectForCells.__end_ = v8;
    operator delete(v8);
  }
  p_textLineIndexesForCells = &self->_textLineIndexesForCells;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_textLineIndexesForCells);
  unint64_t v9 = self->_merges.__begin_;
  if (v9)
  {
    self->_merges.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->_columns.__begin_;
  if (v10)
  {
    self->_columns.__end_ = v10;
    operator delete(v10);
  }
  uint64_t v11 = self->_rows.__begin_;
  if (v11)
  {
    self->_rows.__end_ = v11;
    operator delete(v11);
  }
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_tableQuad, 0);
}

- (id).cxx_construct
{
  *((void *)self + 35) = 0;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 193) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  return self;
}

@end