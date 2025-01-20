uint64_t awd::metrics::protobuf_ShutdownFile_GCK_2eproto(awd::metrics *this)
{
  uint64_t result;

  result = awd::metrics::GCKLinkStatusReport::default_instance_;
  if (awd::metrics::GCKLinkStatusReport::default_instance_) {
    return (*(uint64_t (**)(void))(*(void *)awd::metrics::GCKLinkStatusReport::default_instance_ + 8))();
  }
  return result;
}

void awd::metrics::protobuf_AddDesc_GCK_2eproto(awd::metrics *this, uint64_t a2, uint64_t a3, const char *a4)
{
  if ((awd::metrics::protobuf_AddDesc_GCK_2eproto(void)::already_here & 1) == 0)
  {
    awd::metrics::protobuf_AddDesc_GCK_2eproto(void)::already_here = 1;
    wireless_diagnostics::google::protobuf::internal::VerifyVersion((wireless_diagnostics::google::protobuf::internal *)0x1E9808, 2005000, (uint64_t)"codegen/cpp/GCK.pb.cc", a4);
    operator new();
  }
}

double awd::metrics::GCKLinkStatusReport::GCKLinkStatusReport(awd::metrics::GCKLinkStatusReport *this)
{
  *(void *)this = &unk_26E538B08;
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_26E538B08;
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

uint64_t awd::metrics::GCKLinkStatusReport::SharedCtor(uint64_t this)
{
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  return this;
}

awd::metrics::GCKLinkStatusReport *awd::metrics::GCKLinkStatusReport::GCKLinkStatusReport(awd::metrics::GCKLinkStatusReport *this, const awd::metrics::GCKLinkStatusReport *a2)
{
  *(void *)this = &unk_26E538B08;
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  awd::metrics::GCKLinkStatusReport::MergeFrom(this, a2);
  return this;
}

void sub_2309BAD60(_Unwind_Exception *a1)
{
  uint64_t v3 = *((void *)v1 + 3);
  if (v3) {
    MEMORY[0x230FC3F10](v3, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::metrics::GCKLinkStatusReport::MergeFrom(awd::metrics::GCKLinkStatusReport *this, const awd::metrics::GCKLinkStatusReport *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  }
  int v4 = *((_DWORD *)a2 + 8);
  if (v4)
  {
    wireless_diagnostics::google::protobuf::RepeatedField<unsigned int>::Reserve((uint64_t)this + 24, *((_DWORD *)this + 8) + v4);
    memcpy((void *)(*((void *)this + 3) + 4 * *((int *)this + 8)), *((const void **)a2 + 3), 4 * *((int *)a2 + 8));
    *((_DWORD *)this + 8) += *((_DWORD *)a2 + 8);
  }
  LOBYTE(v5) = *((unsigned char *)a2 + 48);
  if ((_BYTE)v5)
  {
    if (*((unsigned char *)a2 + 48))
    {
      uint64_t v7 = *((void *)a2 + 1);
      *((_DWORD *)this + 12) |= 1u;
      *((void *)this + 1) = v7;
      int v5 = *((_DWORD *)a2 + 12);
      if ((v5 & 2) == 0)
      {
LABEL_8:
        if ((v5 & 4) == 0) {
          return;
        }
        goto LABEL_9;
      }
    }
    else if ((*((unsigned char *)a2 + 48) & 2) == 0)
    {
      goto LABEL_8;
    }
    int v8 = *((_DWORD *)a2 + 4);
    *((_DWORD *)this + 12) |= 2u;
    *((_DWORD *)this + 4) = v8;
    if ((*((_DWORD *)a2 + 12) & 4) == 0) {
      return;
    }
LABEL_9:
    int v6 = *((_DWORD *)a2 + 5);
    *((_DWORD *)this + 12) |= 4u;
    *((_DWORD *)this + 5) = v6;
  }
}

void sub_2309BAEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::metrics::GCKLinkStatusReport::~GCKLinkStatusReport(awd::metrics::GCKLinkStatusReport *this)
{
  *(void *)this = &unk_26E538B08;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    MEMORY[0x230FC3F10](v2, 0x1000C8052888210);
  }

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::metrics::GCKLinkStatusReport::~GCKLinkStatusReport(this);

  JUMPOUT(0x230FC3F20);
}

uint64_t awd::metrics::GCKLinkStatusReport::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 44) = a2;
  return this;
}

uint64_t awd::metrics::GCKLinkStatusReport::default_instance(awd::metrics::GCKLinkStatusReport *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::metrics::GCKLinkStatusReport::default_instance_;
  if (!awd::metrics::GCKLinkStatusReport::default_instance_)
  {
    awd::metrics::protobuf_AddDesc_GCK_2eproto(0, a2, a3, a4);
    return awd::metrics::GCKLinkStatusReport::default_instance_;
  }
  return result;
}

void awd::metrics::GCKLinkStatusReport::New(awd::metrics::GCKLinkStatusReport *this)
{
}

uint64_t awd::metrics::GCKLinkStatusReport::Clear(uint64_t this)
{
  if (*(unsigned char *)(this + 48))
  {
    *(void *)(this + 8) = 0;
    *(void *)(this + 16) = 0;
  }
  *(_DWORD *)(this + 32) = 0;
  *(_DWORD *)(this + 48) = 0;
  return this;
}

uint64_t awd::metrics::GCKLinkStatusReport::MergePartialFromCodedStream(awd::metrics::GCKLinkStatusReport *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (char *)this + 24;
  int v5 = (unint64_t *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 16);
  uint64_t v7 = (unsigned int *)((char *)this + 20);
  while (2)
  {
    int v8 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v8;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v8 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_20;
        }
        v12 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v12 >= v11 || *v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v5);
          if (!result) {
            return result;
          }
          v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *int v5 = *v12;
          v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 12) |= 1u;
        if ((unint64_t)v13 < v11 && *v13 == 16)
        {
          v14 = v13 + 1;
          *((void *)a2 + 1) = v14;
          goto LABEL_30;
        }
        continue;
      case 2u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_20;
        }
        v14 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
LABEL_30:
        if ((unint64_t)v14 >= v11 || *v14 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          v18 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *int v6 = *v14;
          v18 = v14 + 1;
          *((void *)a2 + 1) = v18;
        }
        *((_DWORD *)this + 12) |= 2u;
        if ((unint64_t)v18 >= v11 || *v18 != 24) {
          continue;
        }
        v15 = v18 + 1;
        *((void *)a2 + 1) = v15;
LABEL_38:
        if ((unint64_t)v15 >= v11 || *v15 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v7);
          if (!result) {
            return result;
          }
          v19 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v7 = *v15;
          v19 = v15 + 1;
          *((void *)a2 + 1) = v19;
        }
        *((_DWORD *)this + 12) |= 4u;
        if ((unint64_t)v19 >= v11 || *v19 != 34) {
          continue;
        }
        v16 = v19 + 1;
        *((void *)a2 + 1) = v16;
        goto LABEL_46;
      case 3u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_20;
        }
        v15 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        goto LABEL_38;
      case 4u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) == 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadRepeatedPrimitiveNoInline<unsigned int,(wireless_diagnostics::google::protobuf::internal::WireFormatLite::FieldType)13>(1, 0x22u, a2, (uint64_t)v4);
          if (!result) {
            return result;
          }
          goto LABEL_60;
        }
        if (v10 != 2)
        {
LABEL_20:
          if (v10 == 4) {
            return 1;
          }
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        v16 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
LABEL_46:
        unsigned int v25 = 0;
        if ((unint64_t)v16 < v11 && (*v16 & 0x80000000) == 0)
        {
          unsigned int v25 = *v16;
          *((void *)a2 + 1) = v16 + 1;
          goto LABEL_50;
        }
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v25))
        {
LABEL_50:
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
          {
            unsigned int v24 = 0;
            v20 = (char *)*((void *)a2 + 1);
            if ((unint64_t)v20 >= *((void *)a2 + 2) || *v20 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v24))return 0; {
            }
              }
            else
            {
              unsigned int v24 = *v20;
              *((void *)a2 + 1) = v20 + 1;
            }
            int v21 = *((_DWORD *)this + 8);
            if (v21 == *((_DWORD *)this + 9))
            {
              wireless_diagnostics::google::protobuf::RepeatedField<unsigned int>::Reserve((uint64_t)v4, v21 + 1);
              int v21 = *((_DWORD *)this + 8);
            }
            unsigned int v22 = v24;
            uint64_t v23 = *((void *)this + 3);
            *((_DWORD *)this + 8) = v21 + 1;
            *(_DWORD *)(v23 + 4 * v21) = v22;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
LABEL_60:
          if (*((void *)a2 + 1) == *((void *)a2 + 2)
            && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        return 0;
      default:
        int v10 = TagFallback & 7;
        goto LABEL_20;
    }
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadRepeatedPrimitiveNoInline<unsigned int,(wireless_diagnostics::google::protobuf::internal::WireFormatLite::FieldType)13>(int a1, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *this, uint64_t a4)
{
  unsigned int v21 = 0;
  uint64_t v7 = (char *)*((void *)this + 1);
  if ((unint64_t)v7 >= *((void *)this + 2) || *v7 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v21);
    if (!result) {
      return result;
    }
  }
  else
  {
    unsigned int v21 = *v7;
    *((void *)this + 1) = v7 + 1;
  }
  int v9 = *(_DWORD *)(a4 + 8);
  if (v9 == *(_DWORD *)(a4 + 12))
  {
    wireless_diagnostics::google::protobuf::RepeatedField<unsigned int>::Reserve(a4, v9 + 1);
    int v9 = *(_DWORD *)(a4 + 8);
  }
  unsigned int v10 = v21;
  uint64_t v11 = *(void *)a4;
  *(_DWORD *)(a4 + 8) = v9 + 1;
  *(_DWORD *)(v11 + 4 * v9) = v10;
  int v12 = *(_DWORD *)(a4 + 12) - *(_DWORD *)(a4 + 8);
  if (v12 >= 1)
  {
    int v13 = v12 + 1;
    do
    {
      if (a2 > 0x7F)
      {
        if (a2 >> 14) {
          return 1;
        }
        v17 = (unsigned __int8 *)*((void *)this + 1);
        unint64_t v14 = *((void *)this + 2);
        if ((int)v14 - (int)v17 < 2 || (a2 & 0x7F | 0x80) != *v17 || v17[1] != (a2 >> 7)) {
          return 1;
        }
        v16 = (char *)(v17 + 2);
      }
      else
      {
        v15 = (unsigned __int8 *)*((void *)this + 1);
        unint64_t v14 = *((void *)this + 2);
        if ((unint64_t)v15 >= v14 || *v15 != a2) {
          return 1;
        }
        v16 = (char *)(v15 + 1);
      }
      *((void *)this + 1) = v16;
      if ((unint64_t)v16 >= v14 || *v16 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v21);
        if (!result) {
          return result;
        }
      }
      else
      {
        unsigned int v21 = *v16;
        *((void *)this + 1) = v16 + 1;
      }
      int v18 = *(_DWORD *)(a4 + 8);
      if (v18 >= *(_DWORD *)(a4 + 12))
      {
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v22);
        int v18 = *(_DWORD *)(a4 + 8);
      }
      unsigned int v19 = v21;
      uint64_t v20 = *(void *)a4;
      *(_DWORD *)(a4 + 8) = v18 + 1;
      *(_DWORD *)(v20 + 4 * v18) = v19;
      --v13;
    }
    while (v13 > 1);
  }
  return 1;
}

void sub_2309BB580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t awd::metrics::GCKLinkStatusReport::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v5 = (_DWORD *)this;
  int v6 = *(_DWORD *)(this + 48);
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, v5[4], (uint64_t)a2, a4);
    if ((v5[12] & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 8), (uint64_t)a2, a4);
  int v6 = v5[12];
  if ((v6 & 2) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v6 & 4) != 0) {
LABEL_4:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, v5[5], (uint64_t)a2, a4);
LABEL_5:
  if ((int)v5[8] >= 1)
  {
    wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(a2);
    this = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(a2);
    if ((int)v5[8] >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        this = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(a2);
        ++v7;
      }
      while (v7 < (int)v5[8]);
    }
  }
  return this;
}

uint64_t awd::metrics::GCKLinkStatusReport::ByteSize(awd::metrics::GCKLinkStatusReport *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 48);
  if (!(_BYTE)v2)
  {
    int v3 = 0;
    goto LABEL_16;
  }
  if (*((unsigned char *)this + 48))
  {
    int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                     + 1))
       + 1;
    int v2 = *((_DWORD *)this + 12);
    if ((v2 & 2) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    int v3 = 0;
    if ((*((unsigned char *)this + 48) & 2) == 0) {
      goto LABEL_11;
    }
  }
  int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
  if (v4 >= 0x80)
  {
    int v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
    int v2 = *((_DWORD *)this + 12);
  }
  else
  {
    int v5 = 2;
  }
  v3 += v5;
LABEL_11:
  if ((v2 & 4) != 0)
  {
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 5);
    if (v6 >= 0x80) {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6) + 1;
    }
    else {
      int v7 = 2;
    }
    v3 += v7;
  }
LABEL_16:
  int v8 = *((_DWORD *)this + 8);
  if (v8 < 1)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    uint64_t v9 = 0;
    LODWORD(v10) = 0;
    do
    {
      uint64_t v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 3)
                                                                                             + 4 * v9);
      if (v11 >= 0x80)
      {
        int v12 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v11);
        int v8 = *((_DWORD *)this + 8);
      }
      else
      {
        int v12 = 1;
      }
      unsigned int v10 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(v12 + v10);
      ++v9;
    }
    while (v9 < v8);
    if ((int)v10 > 0)
    {
      if (v10 >= 0x80) {
        int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v10) + 1;
      }
      else {
        int v13 = 2;
      }
      v3 += v13;
    }
  }
  uint64_t result = (v3 + v10);
  *((_DWORD *)this + 10) = v10;
  *((_DWORD *)this + 11) = result;
  return result;
}

void awd::metrics::GCKLinkStatusReport::CheckTypeAndMergeFrom(awd::metrics::GCKLinkStatusReport *this, const wireless_diagnostics::google::protobuf::MessageLite *lpsrc)
{
  awd::metrics::GCKLinkStatusReport::MergeFrom(this, lpsrc);
}

void awd::metrics::GCKLinkStatusReport::CopyFrom(awd::metrics::GCKLinkStatusReport *this, const awd::metrics::GCKLinkStatusReport *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::metrics::GCKLinkStatusReport *))(*(void *)this + 32))(this);
    awd::metrics::GCKLinkStatusReport::MergeFrom(this, a2);
  }
}

uint64_t awd::metrics::GCKLinkStatusReport::IsInitialized(awd::metrics::GCKLinkStatusReport *this)
{
  return 1;
}

double awd::metrics::GCKLinkStatusReport::Swap(awd::metrics::GCKLinkStatusReport *this, awd::metrics::GCKLinkStatusReport *a2)
{
  if (a2 != this)
  {
    uint64_t v2 = *((void *)this + 1);
    *((void *)this + 1) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v2;
    LODWORD(v2) = *((_DWORD *)this + 4);
    *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v2;
    LODWORD(v2) = *((_DWORD *)this + 5);
    *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v2;
    uint64_t v3 = *((void *)this + 3);
    *((void *)this + 3) = *((void *)a2 + 3);
    double result = *((double *)a2 + 4);
    *((void *)a2 + 3) = v3;
    uint64_t v5 = *((void *)this + 4);
    *((double *)this + 4) = result;
    *((void *)a2 + 4) = v5;
    LODWORD(v3) = *((_DWORD *)this + 12);
    *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
    *((_DWORD *)a2 + 12) = v3;
    LODWORD(v3) = *((_DWORD *)this + 11);
    *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
    *((_DWORD *)a2 + 11) = v3;
  }
  return result;
}

void *awd::metrics::GCKLinkStatusReport::GetTypeName@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "awd.metrics.GCKLinkStatusReport");
}

uint64_t awd::metrics::GCKLinkStatusReport::GetCachedSize(awd::metrics::GCKLinkStatusReport *this)
{
  return *((unsigned int *)this + 11);
}

uint64_t wireless_diagnostics::google::protobuf::RepeatedField<unsigned int>::Reserve(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 12);
  if (v2 < a2)
  {
    int v3 = 2 * v2;
    if (v3 <= a2) {
      int v3 = a2;
    }
    if (v3 <= 4) {
      int v3 = 4;
    }
    *(_DWORD *)(result + 12) = v3;
    operator new[]();
  }
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264B96740, MEMORY[0x263F8C060]);
}

void sub_2309BBADC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void awd::metrics::GCKLinkStatusReport::CheckTypeAndMergeFrom()
{
  __assert_rtn("down_cast", "common.h", 348, "f == NULL || dynamic_cast<To>(f) != NULL");
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9AC78](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x270F9AC80](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x270F9AC88](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACB8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACC0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x270F9ACE0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x270F9ACE8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x270F9AD10](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x270F9AD78]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x270F9AD88]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x270F9ADA8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x270F9AEF0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x270F9AF48](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x270F9AF50](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return MEMORY[0x270F9AF98](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9B038](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}