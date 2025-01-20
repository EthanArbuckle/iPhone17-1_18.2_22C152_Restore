uint64_t awd::profile::ComponentConfiguration::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t vars8;

  v5 = this;
  if (*(unsigned char *)(this + 92)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(this + 56), (int)a2, a4);
  }
  if (*(int *)(v5 + 16) >= 1)
  {
    v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  if (*(int *)(v5 + 40) >= 1)
  {
    v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(void *)(*(void *)(v5 + 32) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 40));
  }
  if (*(int *)(v5 + 72) >= 1)
  {
    v8 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(*(void *)(v5 + 64) + 8 * v8++), a2, a4);
    while (v8 < *(int *)(v5 + 72));
  }
  if ((*(unsigned char *)(v5 + 92) & 0x10) != 0)
  {
    v9 = *(_DWORD *)(v5 + 60);
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x14, v9, a2, a4);
  }
  return this;
}

uint64_t awd::profile::ComponentConfiguration::ByteSize(awd::profile::ComponentConfiguration *this, unint64_t a2)
{
  char v3 = *((unsigned char *)this + 92);
  if (!v3)
  {
    int v4 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)this + 92))
  {
    v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 14);
    if ((v5 & 0x80000000) != 0)
    {
      int v4 = 11;
      if ((v3 & 0x10) == 0) {
        goto LABEL_17;
      }
    }
    else if (v5 >= 0x80)
    {
      int v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5, a2) + 1;
      if ((*((_DWORD *)this + 23) & 0x10) == 0) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = 2;
      if ((v3 & 0x10) == 0) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    int v4 = 0;
    if ((*((unsigned char *)this + 92) & 0x10) == 0) {
      goto LABEL_17;
    }
  }
  v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 15);
  if (v6 >= 0x80) {
    int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6, a2) + 2;
  }
  else {
    int v7 = 3;
  }
  v4 += v7;
LABEL_17:
  int v8 = *((_DWORD *)this + 4);
  int v9 = v8 + v4;
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::Profile::ByteSize(*(awd::profile::Profile **)(*((void *)this + 1) + 8 * v10), a2);
      int v12 = (int)v11;
      if (v11 >= 0x80) {
        int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v11, a2);
      }
      else {
        int v13 = 1;
      }
      v9 += v12 + v13;
      ++v10;
    }
    while (v10 < *((int *)this + 4));
  }
  int v14 = *((_DWORD *)this + 10);
  int v15 = v14 + v9;
  if (v14 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      v17 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TriggerSource::ByteSize(*(awd::profile::TriggerSource **)(*((void *)this + 4) + 8 * v16), a2);
      int v18 = (int)v17;
      if (v17 >= 0x80) {
        int v19 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v17, a2);
      }
      else {
        int v19 = 1;
      }
      v15 += v18 + v19;
      ++v16;
    }
    while (v16 < *((int *)this + 10));
  }
  int v20 = *((_DWORD *)this + 18);
  uint64_t v21 = (v20 + v15);
  if (v20 >= 1)
  {
    uint64_t v22 = 0;
    do
    {
      v23 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConfigurationParameter::ByteSize(*(awd::profile::ConfigurationParameter **)(*((void *)this + 8) + 8 * v22), a2);
      int v24 = (int)v23;
      if (v23 >= 0x80) {
        int v25 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v23, a2);
      }
      else {
        int v25 = 1;
      }
      uint64_t v21 = (v24 + v21 + v25);
      ++v22;
    }
    while (v22 < *((int *)this + 18));
  }
  *((_DWORD *)this + 22) = v21;
  return v21;
}

uint64_t awd::profile::ComponentConfiguration::IsInitialized(awd::profile::ComponentConfiguration *this)
{
  return 1;
}

void *awd::profile::ComponentConfiguration::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.ComponentConfiguration");
}

void awd::profile::TimerSpec::MergeFrom(awd::profile::TimerSpec *this, const awd::profile::TimerSpec *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 24);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 24))
    {
      uint64_t v5 = *((void *)a2 + 1);
      *((_DWORD *)this + 6) |= 1u;
      *((void *)this + 1) = v5;
      int v4 = *((_DWORD *)a2 + 6);
    }
    if ((v4 & 2) != 0)
    {
      int v6 = *((_DWORD *)a2 + 4);
      *((_DWORD *)this + 6) |= 2u;
      *((_DWORD *)this + 4) = v6;
    }
  }
}

void sub_1001358D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TimerSpec::~TimerSpec(awd::profile::TimerSpec *this)
{
  *(void *)this = off_1001BEF30;
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TimerSpec::~TimerSpec(this);

  operator delete();
}

void awd::profile::TimerSpec::New(awd::profile::TimerSpec *this)
{
}

uint64_t awd::profile::TimerSpec::Clear(uint64_t this)
{
  if (*(unsigned char *)(this + 24))
  {
    *(void *)(this + 8) = 0;
    *(_DWORD *)(this + 16) = 0;
  }
  *(_DWORD *)(this + 24) = 0;
  return this;
}

uint64_t awd::profile::TimerSpec::MergePartialFromCodedStream(awd::profile::TimerSpec *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (unint64_t *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 16);
  while (1)
  {
    while (1)
    {
      int v7 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
      {
        unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
        *((_DWORD *)a2 + 8) = TagFallback;
        if (!TagFallback) {
          return 1;
        }
      }
      else
      {
        unint64_t TagFallback = *v7;
        *((_DWORD *)a2 + 8) = TagFallback;
        *((void *)a2 + 1) = v7 + 1;
        if (!TagFallback) {
          return 1;
        }
      }
      if (TagFallback >> 3 != 1) {
        break;
      }
      int v9 = TagFallback & 7;
      if ((TagFallback & 7) != 0) {
        goto LABEL_16;
      }
      int v12 = (char *)*((void *)a2 + 1);
      unint64_t v10 = *((void *)a2 + 2);
      if ((unint64_t)v12 >= v10 || *v12 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v5);
        if (!result) {
          return result;
        }
        int v13 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
      }
      else
      {
        unint64_t *v5 = *v12;
        int v13 = v12 + 1;
        *((void *)a2 + 1) = v13;
      }
      *((_DWORD *)this + 6) |= 1u;
      if ((unint64_t)v13 < v10 && *v13 == 16)
      {
        v11 = v13 + 1;
        *((void *)a2 + 1) = v11;
LABEL_24:
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          int v14 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v11;
          int v14 = (unsigned __int8 *)(v11 + 1);
          *((void *)a2 + 1) = v14;
        }
        *((_DWORD *)this + 6) |= 2u;
        if (v14 == (unsigned __int8 *)v10 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
        {
          *((_DWORD *)a2 + 8) = 0;
          uint64_t result = 1;
          *((unsigned char *)a2 + 36) = 1;
          return result;
        }
      }
    }
    if (TagFallback >> 3 == 2)
    {
      int v9 = TagFallback & 7;
      if ((TagFallback & 7) == 0)
      {
        v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        goto LABEL_24;
      }
    }
    else
    {
      int v9 = TagFallback & 7;
    }
LABEL_16:
    if (v9 == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::TimerSpec::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  unsigned int v4 = a2;
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 24);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 8), (unint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 24);
  }
  if ((v6 & 2) != 0)
  {
    int v7 = *(_DWORD *)(v5 + 16);
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, v7, v4, a4);
  }
  return this;
}

uint64_t awd::profile::TimerSpec::ByteSize(wireless_diagnostics::google::protobuf::io::CodedOutputStream **this, unint64_t a2)
{
  if (*((unsigned char *)this + 24))
  {
    if ((_BYTE)this[3])
    {
      uint64_t v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(this[1], a2) + 1;
      if ((this[3] & 2) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v3 = 0;
      if (((_BYTE)this[3] & 2) == 0) {
        goto LABEL_11;
      }
    }
    unsigned int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
    if (v4 >= 0x80) {
      int v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4, a2) + 1;
    }
    else {
      int v5 = 2;
    }
    uint64_t v3 = (v5 + v3);
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_11:
  *((_DWORD *)this + 5) = v3;
  return v3;
}

uint64_t awd::profile::TimerSpec::IsInitialized(awd::profile::TimerSpec *this)
{
  return 1;
}

void *awd::profile::TimerSpec::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.TimerSpec");
}

void awd::profile::TypeVariant::~TypeVariant(awd::profile::TypeVariant *this)
{
  *(void *)this = off_1001BEFA8;
  awd::profile::TypeVariant::SharedDtor(this);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TypeVariant::~TypeVariant(this);

  operator delete();
}

void awd::profile::TypeVariant::SharedDtor(awd::profile::TypeVariant *this)
{
  uint64_t v1 = *((void *)this + 6);
  if ((_UNKNOWN *)v1 != &wireless_diagnostics::google::protobuf::internal::kEmptyString && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    operator delete();
  }
  uint64_t v3 = *((void *)this + 7);
  if ((_UNKNOWN *)v3 != &wireless_diagnostics::google::protobuf::internal::kEmptyString && v3 != 0)
  {
    if (*(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    operator delete();
  }

  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
}

void awd::profile::TypeVariant::New(awd::profile::TypeVariant *this)
{
}

uint64_t awd::profile::TypeVariant::MergePartialFromCodedStream(awd::profile::TypeVariant *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  int v5 = (unsigned int *)((char *)this + 20);
  int v6 = (unint64_t *)((char *)this + 24);
  while (2)
  {
    int v7 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v7;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v7 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        v35[0] = 0;
        v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v35);
          if (!result) {
            return result;
          }
          unsigned int v12 = v35[0];
          int v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v12 = *v11;
          int v13 = v11 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 4) = v12;
        *((_DWORD *)this + 18) |= 1u;
        if ((unint64_t)v13 < v10 && *v13 == 16)
        {
          int v14 = v13 + 1;
          *((void *)a2 + 1) = v14;
          goto LABEL_39;
        }
        continue;
      case 2u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        int v14 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
LABEL_39:
        *(void *)v35 = 0;
        if ((unint64_t)v14 >= v10 || *v14 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, (unint64_t *)v35);
          if (!result) {
            return result;
          }
          uint64_t v24 = *(void *)v35;
          int v25 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          uint64_t v24 = *v14;
          int v25 = v14 + 1;
          *((void *)a2 + 1) = v25;
        }
        *((void *)this + 1) = v24;
        *((_DWORD *)this + 18) |= 2u;
        if ((unint64_t)v25 >= v10 || *v25 != 24) {
          continue;
        }
        int v15 = v25 + 1;
        *((void *)a2 + 1) = v15;
LABEL_47:
        if ((unint64_t)v15 >= v10 || *v15 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          v26 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v5 = *v15;
          v26 = v15 + 1;
          *((void *)a2 + 1) = v26;
        }
        *((_DWORD *)this + 18) |= 4u;
        if ((unint64_t)v26 >= v10 || *v26 != 32) {
          continue;
        }
        uint64_t v16 = v26 + 1;
        *((void *)a2 + 1) = v16;
LABEL_55:
        if ((unint64_t)v16 >= v10 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v6);
          if (!result) {
            return result;
          }
          v27 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unint64_t *v6 = *v16;
          v27 = v16 + 1;
          *((void *)a2 + 1) = v27;
        }
        *((_DWORD *)this + 18) |= 8u;
        if ((unint64_t)v27 >= v10 || *v27 != 45) {
          continue;
        }
        *((void *)a2 + 1) = v27 + 1;
LABEL_63:
        v35[0] = 0;
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(a2, v35) & 1) == 0) {
          return 0;
        }
        *((_DWORD *)this + 10) = v35[0];
        *((_DWORD *)this + 18) |= 0x10u;
        v28 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v28 >= *((void *)a2 + 2) || *v28 != 49) {
          continue;
        }
        *((void *)a2 + 1) = v28 + 1;
LABEL_67:
        *(void *)v35 = 0;
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, (unint64_t *)v35))
        {
          *((void *)this + 4) = *(void *)v35;
          int v17 = *((_DWORD *)this + 18) | 0x20;
          *((_DWORD *)this + 18) = v17;
          v29 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v29 < *((void *)a2 + 2) && *v29 == 58)
          {
            *((void *)a2 + 1) = v29 + 1;
LABEL_71:
            *((_DWORD *)this + 18) = v17 | 0x40;
            if (*((_UNKNOWN **)this + 6) == &wireless_diagnostics::google::protobuf::internal::kEmptyString) {
              operator new();
            }
            uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
            if (!result) {
              return result;
            }
            v30 = (unsigned char *)*((void *)a2 + 1);
            unint64_t v18 = *((void *)a2 + 2);
            if ((unint64_t)v30 < v18 && *v30 == 64)
            {
              int v19 = v30 + 1;
              *((void *)a2 + 1) = v19;
LABEL_77:
              v35[0] = 0;
              if ((unint64_t)v19 >= v18 || *v19 < 0)
              {
                uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v35);
                if (!result) {
                  return result;
                }
                unsigned int v31 = v35[0];
                v32 = (unsigned char *)*((void *)a2 + 1);
                unint64_t v18 = *((void *)a2 + 2);
              }
              else
              {
                unsigned int v31 = *v19;
                v32 = v19 + 1;
                *((void *)a2 + 1) = v32;
              }
              *((unsigned char *)this + 44) = v31 != 0;
              int v20 = *((_DWORD *)this + 18) | 0x80;
              *((_DWORD *)this + 18) = v20;
              if ((unint64_t)v32 < v18 && *v32 == 74)
              {
                *((void *)a2 + 1) = v32 + 1;
LABEL_85:
                *((_DWORD *)this + 18) = v20 | 0x100;
                if (*((_UNKNOWN **)this + 7) == &wireless_diagnostics::google::protobuf::internal::kEmptyString) {
                  operator new();
                }
                uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
                if (!result) {
                  return result;
                }
                v33 = (unsigned char *)*((void *)a2 + 1);
                unint64_t v21 = *((void *)a2 + 2);
                if ((unint64_t)v33 < v21 && *v33 == 80)
                {
                  uint64_t v22 = v33 + 1;
                  *((void *)a2 + 1) = v22;
LABEL_91:
                  v35[0] = 0;
                  if ((unint64_t)v22 >= v21 || (int v34 = *v22, v34 < 0))
                  {
                    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v35);
                    if (!result) {
                      return result;
                    }
                    if (v35[0]) {
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    *((void *)a2 + 1) = v22 + 1;
                    if ((_BYTE)v34) {
                      goto LABEL_95;
                    }
                  }
                  *((_DWORD *)this + 18) |= 0x200u;
                  *((_DWORD *)this + 16) = 0;
LABEL_95:
                  if (*((void *)a2 + 1) == *((void *)a2 + 2)
                    && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                  {
                    *((_DWORD *)a2 + 8) = 0;
                    uint64_t result = 1;
                    *((unsigned char *)a2 + 36) = 1;
                    return result;
                  }
                }
              }
            }
          }
          continue;
        }
        return 0;
      case 3u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        int v15 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        goto LABEL_47;
      case 4u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        uint64_t v16 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        goto LABEL_55;
      case 5u:
        int v9 = TagFallback & 7;
        if (v9 == 5) {
          goto LABEL_63;
        }
        goto LABEL_30;
      case 6u:
        int v9 = TagFallback & 7;
        if (v9 == 1) {
          goto LABEL_67;
        }
        goto LABEL_30;
      case 7u:
        int v9 = TagFallback & 7;
        if (v9 != 2) {
          goto LABEL_30;
        }
        int v17 = *((_DWORD *)this + 18);
        goto LABEL_71;
      case 8u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        int v19 = (char *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        goto LABEL_77;
      case 9u:
        int v9 = TagFallback & 7;
        if (v9 != 2) {
          goto LABEL_30;
        }
        int v20 = *((_DWORD *)this + 18);
        goto LABEL_85;
      case 0xAu:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        uint64_t v22 = (char *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_91;
      default:
        int v9 = TagFallback & 7;
LABEL_30:
        if (v9 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
        continue;
        }
    }
  }
}

uint64_t awd::profile::TypeVariant::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 72);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(this + 16), (int)a2, a4);
    int v6 = *(_DWORD *)(v5 + 72);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(v5 + 8), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(_DWORD *)(v5 + 20), a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(v5 + 24), (unint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, (int)a2, *(float *)(v5 + 40), a3);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x20) == 0)
  {
LABEL_7:
    if ((v6 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, (int)a2, *(double *)(v5 + 32), a3);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x40) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x80) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
    if ((*(_DWORD *)(v5 + 72) & 0x200) == 0) {
      return this;
    }
    goto LABEL_21;
  }
LABEL_19:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)8, *(unsigned __int8 *)(v5 + 44), (BOOL)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x100) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v6 & 0x200) == 0) {
    return this;
  }
LABEL_21:
  int v7 = *(_DWORD *)(v5 + 64);

  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xA, v7, (int)a2, a4);
}

uint64_t awd::profile::TypeVariant::ByteSize(awd::profile::TypeVariant *this, unint64_t a2)
{
  int v3 = *((_DWORD *)this + 18);
  if (!(_BYTE)v3)
  {
    uint64_t v5 = 0;
    goto LABEL_37;
  }
  if ((v3 & 1) == 0)
  {
    int v4 = 0;
    if ((v3 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
  if ((v6 & 0x80000000) != 0)
  {
    int v4 = 11;
    if ((v3 & 2) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v6 >= 0x80)
    {
      int v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6, a2) + 1;
      int v3 = *((_DWORD *)this + 18);
      if ((v3 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    int v4 = 2;
    if ((v3 & 2) != 0)
    {
LABEL_13:
      v4 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this + 1), a2)+ 1;
      int v3 = *((_DWORD *)this + 18);
    }
  }
LABEL_14:
  if ((v3 & 4) != 0)
  {
    int v14 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 5);
    if (v14 >= 0x80)
    {
      int v15 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v14, a2) + 1;
      int v3 = *((_DWORD *)this + 18);
    }
    else
    {
      int v15 = 2;
    }
    v4 += v15;
    if ((v3 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((v3 & 8) != 0)
  {
LABEL_16:
    v4 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this + 3), a2)+ 1;
    int v3 = *((_DWORD *)this + 18);
  }
LABEL_17:
  int v7 = v4 + 5;
  if ((v3 & 0x10) == 0) {
    int v7 = v4;
  }
  if ((v3 & 0x20) != 0) {
    LODWORD(v5) = v7 + 9;
  }
  else {
    LODWORD(v5) = v7;
  }
  if ((v3 & 0x40) != 0)
  {
    uint64_t v8 = *((void *)this + 6);
    int v9 = *(unsigned __int8 *)(v8 + 23);
    char v10 = v9;
    uint64_t v11 = *(void *)(v8 + 8);
    if ((v9 & 0x80u) == 0) {
      unint64_t v12 = *(unsigned __int8 *)(v8 + 23);
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12 >= 0x80)
    {
      int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v12, a2);
      int v9 = *(unsigned __int8 *)(v8 + 23);
      uint64_t v11 = *(void *)(v8 + 8);
      int v3 = *((_DWORD *)this + 18);
      char v10 = *(unsigned char *)(v8 + 23);
    }
    else
    {
      int v13 = 1;
    }
    if (v10 < 0) {
      int v9 = v11;
    }
    LODWORD(v5) = v5 + v13 + v9 + 1;
  }
  if ((v3 & 0x80) != 0) {
    uint64_t v5 = (v5 + 2);
  }
  else {
    uint64_t v5 = v5;
  }
LABEL_37:
  if ((v3 & 0xFF00) != 0)
  {
    if ((v3 & 0x100) != 0)
    {
      uint64_t v16 = *((void *)this + 7);
      int v17 = *(unsigned __int8 *)(v16 + 23);
      char v18 = v17;
      uint64_t v19 = *(void *)(v16 + 8);
      if ((v17 & 0x80u) == 0) {
        unint64_t v20 = *(unsigned __int8 *)(v16 + 23);
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20 >= 0x80)
      {
        int v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v20, a2);
        int v17 = *(unsigned __int8 *)(v16 + 23);
        uint64_t v19 = *(void *)(v16 + 8);
        int v3 = *((_DWORD *)this + 18);
        char v18 = *(unsigned char *)(v16 + 23);
      }
      else
      {
        int v21 = 1;
      }
      if (v18 < 0) {
        int v17 = v19;
      }
      uint64_t v5 = (v5 + v21 + v17 + 1);
    }
    if ((v3 & 0x200) != 0)
    {
      uint64_t v22 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 16);
      if ((v22 & 0x80000000) != 0)
      {
        int v23 = 11;
      }
      else if (v22 >= 0x80)
      {
        int v23 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v22, a2) + 1;
      }
      else
      {
        int v23 = 2;
      }
      uint64_t v5 = (v23 + v5);
    }
  }
  *((_DWORD *)this + 17) = v5;
  return v5;
}

uint64_t awd::profile::TypeVariant::IsInitialized(awd::profile::TypeVariant *this)
{
  return 1;
}

void *awd::profile::TypeVariant::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.TypeVariant");
}

void awd::profile::Condition::MergeFrom(awd::profile::Condition *this, const awd::profile::Condition *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v20);
  }
  int v4 = *((_DWORD *)a2 + 17);
  if (!(_BYTE)v4) {
    goto LABEL_37;
  }
  if (v4)
  {
    int v5 = *((_DWORD *)a2 + 2);
    *((_DWORD *)this + 17) |= 1u;
    *((_DWORD *)this + 2) = v5;
    int v4 = *((_DWORD *)a2 + 17);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_6;
  }
  int v6 = *((_DWORD *)a2 + 3);
  *((_DWORD *)this + 17) |= 2u;
  *((_DWORD *)this + 3) = v6;
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  int v7 = *((_DWORD *)a2 + 6);
  *((_DWORD *)this + 17) |= 4u;
  *((_DWORD *)this + 6) = v7;
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  char v8 = *((unsigned char *)a2 + 28);
  *((_DWORD *)this + 17) |= 8u;
  *((unsigned char *)this + 28) = v8;
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_22:
    *((_DWORD *)this + 17) |= 0x20u;
    uint64_t v11 = (awd::profile::TypeVariant *)*((void *)this + 4);
    if (!v11) {
      operator new();
    }
    unint64_t v12 = (const awd::profile::TypeVariant *)*((void *)a2 + 4);
    if (!v12)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
      unint64_t v12 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 32);
    }
    awd::profile::TypeVariant::MergeFrom(v11, v12);
    int v4 = *((_DWORD *)a2 + 17);
    if ((v4 & 0x40) == 0)
    {
LABEL_11:
      if ((v4 & 0x80) == 0) {
        goto LABEL_37;
      }
      goto LABEL_32;
    }
    goto LABEL_27;
  }
LABEL_17:
  *((_DWORD *)this + 17) |= 0x10u;
  int v9 = (awd::profile::TypeVariant *)*((void *)this + 2);
  if (!v9) {
    operator new();
  }
  char v10 = (const awd::profile::TypeVariant *)*((void *)a2 + 2);
  if (!v10)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
    char v10 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 16);
  }
  awd::profile::TypeVariant::MergeFrom(v9, v10);
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 0x20) != 0) {
    goto LABEL_22;
  }
LABEL_10:
  if ((v4 & 0x40) == 0) {
    goto LABEL_11;
  }
LABEL_27:
  *((_DWORD *)this + 17) |= 0x40u;
  int v13 = (awd::profile::TypeVariant *)*((void *)this + 5);
  if (!v13) {
    operator new();
  }
  int v14 = (const awd::profile::TypeVariant *)*((void *)a2 + 5);
  if (!v14)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
    int v14 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 40);
  }
  awd::profile::TypeVariant::MergeFrom(v13, v14);
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 0x80) != 0)
  {
LABEL_32:
    *((_DWORD *)this + 17) |= 0x80u;
    int v15 = (awd::profile::TypeVariant *)*((void *)this + 6);
    if (!v15) {
      operator new();
    }
    uint64_t v16 = (const awd::profile::TypeVariant *)*((void *)a2 + 6);
    if (!v16)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
      uint64_t v16 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 48);
    }
    awd::profile::TypeVariant::MergeFrom(v15, v16);
    int v4 = *((_DWORD *)a2 + 17);
  }
LABEL_37:
  if ((v4 & 0xFF00) != 0)
  {
    if ((v4 & 0x100) != 0)
    {
      int v17 = (const std::string *)*((void *)a2 + 7);
      *((_DWORD *)this + 17) |= 0x100u;
      char v18 = (std::string *)*((void *)this + 7);
      if (v18 == (std::string *)&wireless_diagnostics::google::protobuf::internal::kEmptyString) {
        operator new();
      }
      std::string::operator=(v18, v17);
      int v4 = *((_DWORD *)a2 + 17);
    }
    if ((v4 & 0x200) != 0)
    {
      char v19 = *((unsigned char *)a2 + 29);
      *((_DWORD *)this + 17) |= 0x200u;
      *((unsigned char *)this + 29) = v19;
    }
  }
}

void sub_100136B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::Condition::~Condition(awd::profile::Condition *this)
{
  *(void *)this = off_1001BF020;
  awd::profile::Condition::SharedDtor(this);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::Condition::~Condition(this);

  operator delete();
}

void awd::profile::Condition::SharedDtor(awd::profile::Condition *this)
{
  uint64_t v2 = *((void *)this + 7);
  if ((_UNKNOWN *)v2 != &wireless_diagnostics::google::protobuf::internal::kEmptyString && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    operator delete();
  }
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
  if ((awd::profile::Condition *)awd::profile::Condition::default_instance_ != this)
  {
    uint64_t v4 = *((void *)this + 2);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    uint64_t v5 = *((void *)this + 4);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    uint64_t v6 = *((void *)this + 5);
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
    uint64_t v7 = *((void *)this + 6);
    if (v7)
    {
      char v8 = *(void (**)(void))(*(void *)v7 + 8);
      v8();
    }
  }
}

uint64_t awd::profile::Condition::default_instance(awd::profile::Condition *this)
{
  return awd::profile::Condition::default_instance_;
}

void awd::profile::Condition::New(awd::profile::Condition *this)
{
}

uint64_t awd::profile::Condition::Clear(uint64_t this)
{
  uint64_t v1 = this;
  int v2 = *(_DWORD *)(this + 68);
  if ((_BYTE)v2)
  {
    *(void *)(this + 8) = 0;
    *(_DWORD *)(this + 24) = 0;
    *(unsigned char *)(this + 28) = 0;
    if ((v2 & 0x10) != 0)
    {
      this = *(void *)(this + 16);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
    if ((v2 & 0x20) != 0)
    {
      this = *(void *)(v1 + 32);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
    if ((v2 & 0x40) != 0)
    {
      this = *(void *)(v1 + 40);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
    if ((v2 & 0x80) != 0)
    {
      this = *(void *)(v1 + 48);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
  }
  if ((v2 & 0xFF00) != 0)
  {
    if ((v2 & 0x100) != 0)
    {
      uint64_t v3 = *(void *)(v1 + 56);
      if ((_UNKNOWN *)v3 != &wireless_diagnostics::google::protobuf::internal::kEmptyString)
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
    *(unsigned char *)(v1 + 29) = 0;
  }
  *(_DWORD *)(v1 + 68) = 0;
  return this;
}

uint64_t awd::profile::Condition::MergePartialFromCodedStream(awd::profile::Condition *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (unsigned int *)((char *)this + 8);
  uint64_t v6 = (unsigned int *)((char *)this + 12);
  while (2)
  {
    uint64_t v7 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v7;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v7 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    unsigned int v9 = TagFallback >> 3;
    switch(TagFallback >> 3)
    {
      case 1u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        unint64_t v12 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v12 >= v11 || *v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          int v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v5 = *v12;
          int v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 17) |= 1u;
        if ((unint64_t)v13 < v11 && *v13 == 16)
        {
          uint64_t v16 = v13 + 1;
          *((void *)a2 + 1) = v16;
          goto LABEL_40;
        }
        continue;
      case 2u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        uint64_t v16 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
LABEL_40:
        if ((unint64_t)v16 >= v11 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          uint64_t v22 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v16;
          uint64_t v22 = v16 + 1;
          *((void *)a2 + 1) = v22;
        }
        *((_DWORD *)this + 17) |= 2u;
        if ((unint64_t)v22 >= v11 || *v22 != 24) {
          continue;
        }
        int v17 = v22 + 1;
        *((void *)a2 + 1) = v17;
LABEL_48:
        unsigned int v67 = 0;
        if ((unint64_t)v17 < v11)
        {
          int v23 = *v17;
          if ((v23 & 0x80000000) == 0)
          {
            *((void *)a2 + 1) = v17 + 1;
            if ((_BYTE)v23) {
              goto LABEL_52;
            }
LABEL_51:
            *((_DWORD *)this + 17) |= 4u;
            *((_DWORD *)this + 6) = 0;
            goto LABEL_52;
          }
        }
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67);
        if (!result) {
          return result;
        }
        if (!v67) {
          goto LABEL_51;
        }
LABEL_52:
        uint64_t v24 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v24 < 2 || *v24 != 130 || v24[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v24 + 2;
LABEL_56:
        *((_DWORD *)this + 17) |= 0x20u;
        int v25 = (awd::profile::TypeVariant *)*((void *)this + 4);
        if (!v25) {
          operator new();
        }
        unsigned int v67 = 0;
        v26 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v26 >= *((void *)a2 + 2) || *v26 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67))return 0; {
        }
          }
        else
        {
          unsigned int v67 = *v26;
          *((void *)a2 + 1) = v26 + 1;
        }
        int v27 = *((_DWORD *)a2 + 14);
        int v28 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v27 + 1;
        if (v27 >= v28) {
          return 0;
        }
        int v29 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v67);
        if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v25, a2, v30) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v29);
        int v31 = *((_DWORD *)a2 + 14);
        BOOL v32 = __OFSUB__(v31, 1);
        int v33 = v31 - 1;
        if (v33 < 0 == v32) {
          *((_DWORD *)a2 + 14) = v33;
        }
        int v34 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v34 <= 1 || *v34 != 138 || v34[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v34 + 2;
LABEL_71:
        *((_DWORD *)this + 17) |= 0x40u;
        v35 = (awd::profile::TypeVariant *)*((void *)this + 5);
        if (!v35) {
          operator new();
        }
        unsigned int v67 = 0;
        v36 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v36 >= *((void *)a2 + 2) || *v36 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67))return 0; {
        }
          }
        else
        {
          unsigned int v67 = *v36;
          *((void *)a2 + 1) = v36 + 1;
        }
        int v37 = *((_DWORD *)a2 + 14);
        int v38 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v37 + 1;
        if (v37 >= v38) {
          return 0;
        }
        int v39 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v67);
        if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v35, a2, v40) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v39);
        int v41 = *((_DWORD *)a2 + 14);
        BOOL v32 = __OFSUB__(v41, 1);
        int v42 = v41 - 1;
        if (v42 < 0 == v32) {
          *((_DWORD *)a2 + 14) = v42;
        }
        v43 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v43 <= 1 || *v43 != 146 || v43[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v43 + 2;
LABEL_89:
        *((_DWORD *)this + 17) |= 0x100u;
        if (*((_UNKNOWN **)this + 7) == &wireless_diagnostics::google::protobuf::internal::kEmptyString) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        v44 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        if ((int)v18 - (int)v44 < 2 || *v44 != 152 || v44[1] != 1) {
          continue;
        }
        char v19 = v44 + 2;
        *((void *)a2 + 1) = v19;
LABEL_96:
        unsigned int v67 = 0;
        if ((unint64_t)v19 >= v18 || (char)*v19 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67);
          if (!result) {
            return result;
          }
          unsigned int v45 = v67;
          v46 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v18 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v45 = *v19;
          v46 = v19 + 1;
          *((void *)a2 + 1) = v46;
        }
        *((unsigned char *)this + 28) = v45 != 0;
        int v20 = *((_DWORD *)this + 17) | 8;
        *((_DWORD *)this + 17) = v20;
        if ((int)v18 - (int)v46 < 2 || *v46 != 162 || v46[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v46 + 2;
LABEL_105:
        *((_DWORD *)this + 17) = v20 | 0x10;
        v47 = (awd::profile::TypeVariant *)*((void *)this + 2);
        if (!v47) {
          operator new();
        }
        unsigned int v67 = 0;
        v48 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v48 >= *((void *)a2 + 2) || *v48 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67))return 0; {
        }
          }
        else
        {
          unsigned int v67 = *v48;
          *((void *)a2 + 1) = v48 + 1;
        }
        int v49 = *((_DWORD *)a2 + 14);
        int v50 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v49 + 1;
        if (v49 >= v50) {
          return 0;
        }
        int v51 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v67);
        if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v47, a2, v52) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v51);
        int v53 = *((_DWORD *)a2 + 14);
        BOOL v32 = __OFSUB__(v53, 1);
        int v54 = v53 - 1;
        if (v54 < 0 == v32) {
          *((_DWORD *)a2 + 14) = v54;
        }
        v55 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v55 <= 1 || *v55 != 130 || v55[1] != 2) {
          continue;
        }
        *((void *)a2 + 1) = v55 + 2;
        goto LABEL_120;
      case 3u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        int v17 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        goto LABEL_48;
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        goto LABEL_16;
      case 0x10u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_56;
        }
        goto LABEL_32;
      case 0x11u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_71;
        }
        goto LABEL_32;
      case 0x12u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_89;
        }
        goto LABEL_32;
      case 0x13u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        char v19 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        goto LABEL_96;
      case 0x14u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_32;
        }
        int v20 = *((_DWORD *)this + 17);
        goto LABEL_105;
      default:
        if (v9 != 32)
        {
          if (v9 == 33)
          {
            int v10 = TagFallback & 7;
            if ((TagFallback & 7) == 0)
            {
              int v15 = (char *)*((void *)a2 + 1);
              unint64_t v14 = *((void *)a2 + 2);
              goto LABEL_135;
            }
          }
          else
          {
LABEL_16:
            int v10 = TagFallback & 7;
          }
LABEL_32:
          if (v10 == 4) {
            return 1;
          }
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
          continue;
          }
        }
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_32;
        }
LABEL_120:
        *((_DWORD *)this + 17) |= 0x80u;
        v56 = (awd::profile::TypeVariant *)*((void *)this + 6);
        if (!v56) {
          operator new();
        }
        unsigned int v67 = 0;
        v57 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v57 >= *((void *)a2 + 2) || *v57 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67))return 0; {
        }
          }
        else
        {
          unsigned int v67 = *v57;
          *((void *)a2 + 1) = v57 + 1;
        }
        int v58 = *((_DWORD *)a2 + 14);
        int v59 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v58 + 1;
        if (v58 < v59)
        {
          int v60 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v67);
          if (awd::profile::TypeVariant::MergePartialFromCodedStream(v56, a2, v61))
          {
            if (*((unsigned char *)a2 + 36))
            {
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v60);
              int v62 = *((_DWORD *)a2 + 14);
              BOOL v32 = __OFSUB__(v62, 1);
              int v63 = v62 - 1;
              if (v63 < 0 == v32) {
                *((_DWORD *)a2 + 14) = v63;
              }
              v64 = (unsigned __int8 *)*((void *)a2 + 1);
              unint64_t v14 = *((void *)a2 + 2);
              if ((int)v14 - (int)v64 > 1 && *v64 == 136 && v64[1] == 2)
              {
                int v15 = (char *)(v64 + 2);
                *((void *)a2 + 1) = v15;
LABEL_135:
                unsigned int v67 = 0;
                if ((unint64_t)v15 >= v14 || *v15 < 0)
                {
                  uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v67);
                  if (!result) {
                    return result;
                  }
                  unsigned int v65 = v67;
                  v66 = (unsigned __int8 *)*((void *)a2 + 1);
                  unint64_t v14 = *((void *)a2 + 2);
                }
                else
                {
                  unsigned int v65 = *v15;
                  v66 = (unsigned __int8 *)(v15 + 1);
                  *((void *)a2 + 1) = v66;
                }
                *((unsigned char *)this + 29) = v65 != 0;
                *((_DWORD *)this + 17) |= 0x200u;
                if (v66 == (unsigned __int8 *)v14
                  && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                {
                  *((_DWORD *)a2 + 8) = 0;
                  uint64_t result = 1;
                  *((unsigned char *)a2 + 36) = 1;
                  return result;
                }
              }
              continue;
            }
          }
        }
        return 0;
    }
  }
}

int *awd::profile::Condition::SerializeWithCachedSizes(int *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = this[17];
  if (v6)
  {
    this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, this[2], a2, a4);
    int v6 = v5[17];
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, v5[3], a2, a4);
  int v6 = v5[17];
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, v5[6], (int)a2, a4);
  int v6 = v5[17];
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v7 = *((void *)v5 + 4);
  if (!v7)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
    uint64_t v7 = *(void *)(awd::profile::Condition::default_instance_ + 32);
  }
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, v7, a2, a4);
  int v6 = v5[17];
  if ((v6 & 0x40) == 0)
  {
LABEL_6:
    if ((v6 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v8 = *((void *)v5 + 5);
  if (!v8)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
    uint64_t v8 = *(void *)(awd::profile::Condition::default_instance_ + 40);
  }
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x11, v8, a2, a4);
  int v6 = v5[17];
  if ((v6 & 0x100) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  int v6 = v5[17];
  if ((v6 & 8) == 0)
  {
LABEL_8:
    if ((v6 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x13, *((unsigned __int8 *)v5 + 28), (BOOL)a2, a4);
  int v6 = v5[17];
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v9 = *((void *)v5 + 2);
  if (!v9)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
    uint64_t v9 = *(void *)(awd::profile::Condition::default_instance_ + 16);
  }
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x14, v9, a2, a4);
  int v6 = v5[17];
  if ((v6 & 0x80) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0) {
      return this;
    }
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v10 = *((void *)v5 + 6);
  if (!v10)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
    uint64_t v10 = *(void *)(awd::profile::Condition::default_instance_ + 48);
  }
  this = (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x20, v10, a2, a4);
  if ((v5[17] & 0x200) != 0)
  {
LABEL_29:
    int v11 = *((unsigned __int8 *)v5 + 29);
    return (int *)wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x21, v11, (BOOL)a2, a4);
  }
  return this;
}

uint64_t awd::profile::Condition::ByteSize(awd::profile::Condition *this, unint64_t a2)
{
  int v3 = *((_DWORD *)this + 17);
  if (!(_BYTE)v3)
  {
    uint64_t v4 = 0;
    goto LABEL_53;
  }
  if ((v3 & 1) == 0)
  {
    LODWORD(v4) = 0;
    if ((v3 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if (v5 >= 0x80)
  {
    int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5, a2);
    int v3 = *((_DWORD *)this + 17);
  }
  else
  {
    int v6 = 1;
  }
  LODWORD(v4) = v6 + 1;
  if ((v3 & 2) != 0)
  {
LABEL_10:
    uint64_t v7 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if (v7 >= 0x80)
    {
      int v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v7, a2);
      int v3 = *((_DWORD *)this + 17);
    }
    else
    {
      int v8 = 1;
    }
    LODWORD(v4) = v4 + v8 + 1;
  }
LABEL_14:
  if ((v3 & 4) != 0)
  {
    uint64_t v9 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 6);
    if ((v9 & 0x80000000) != 0)
    {
      int v10 = 10;
    }
    else if (v9 >= 0x80)
    {
      int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v9, a2);
      int v3 = *((_DWORD *)this + 17);
    }
    else
    {
      int v10 = 1;
    }
    LODWORD(v4) = v4 + v10 + 1;
  }
  if ((v3 & 8) != 0) {
    uint64_t v4 = (v4 + 3);
  }
  else {
    uint64_t v4 = v4;
  }
  if ((v3 & 0x10) != 0)
  {
    int v11 = (awd::profile::TypeVariant *)*((void *)this + 2);
    if (!v11)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0);
      int v11 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 16);
    }
    unint64_t v12 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v11, a2);
    int v13 = (int)v12;
    if (v12 >= 0x80) {
      int v14 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v12, a2);
    }
    else {
      int v14 = 1;
    }
    uint64_t v4 = (v4 + v13 + v14 + 2);
    int v3 = *((_DWORD *)this + 17);
    if ((v3 & 0x20) == 0)
    {
LABEL_26:
      if ((v3 & 0x40) == 0) {
        goto LABEL_27;
      }
      goto LABEL_41;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_26;
  }
  int v15 = (awd::profile::TypeVariant *)*((void *)this + 4);
  if (!v15)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0);
    int v15 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 32);
  }
  uint64_t v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v15, a2);
  int v17 = (int)v16;
  if (v16 >= 0x80) {
    int v18 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16, a2);
  }
  else {
    int v18 = 1;
  }
  uint64_t v4 = (v4 + v17 + v18 + 2);
  int v3 = *((_DWORD *)this + 17);
  if ((v3 & 0x40) == 0)
  {
LABEL_27:
    if ((v3 & 0x80) == 0) {
      goto LABEL_53;
    }
    goto LABEL_47;
  }
LABEL_41:
  char v19 = (awd::profile::TypeVariant *)*((void *)this + 5);
  if (!v19)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0);
    char v19 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 40);
  }
  int v20 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v19, a2);
  int v21 = (int)v20;
  if (v20 >= 0x80) {
    int v22 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v20, a2);
  }
  else {
    int v22 = 1;
  }
  uint64_t v4 = (v4 + v21 + v22 + 2);
  int v3 = *((_DWORD *)this + 17);
  if ((v3 & 0x80) != 0)
  {
LABEL_47:
    int v23 = (awd::profile::TypeVariant *)*((void *)this + 6);
    if (!v23)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0);
      int v23 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 48);
    }
    uint64_t v24 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v23, a2);
    int v25 = (int)v24;
    if (v24 >= 0x80) {
      int v26 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v24, a2);
    }
    else {
      int v26 = 1;
    }
    uint64_t v4 = (v4 + v25 + v26 + 2);
    int v3 = *((_DWORD *)this + 17);
  }
LABEL_53:
  if ((v3 & 0xFF00) != 0)
  {
    if ((v3 & 0x100) != 0)
    {
      uint64_t v27 = *((void *)this + 7);
      int v28 = *(unsigned __int8 *)(v27 + 23);
      char v29 = v28;
      uint64_t v30 = *(void *)(v27 + 8);
      if ((v28 & 0x80u) == 0) {
        unint64_t v31 = *(unsigned __int8 *)(v27 + 23);
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31 >= 0x80)
      {
        int v32 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v31, a2);
        int v28 = *(unsigned __int8 *)(v27 + 23);
        uint64_t v30 = *(void *)(v27 + 8);
        int v3 = *((_DWORD *)this + 17);
        char v29 = *(unsigned char *)(v27 + 23);
      }
      else
      {
        int v32 = 1;
      }
      if (v29 < 0) {
        int v28 = v30;
      }
      LODWORD(v4) = v4 + v32 + v28 + 2;
    }
    if ((v3 & 0x200) != 0) {
      uint64_t v4 = (v4 + 3);
    }
    else {
      uint64_t v4 = v4;
    }
  }
  *((_DWORD *)this + 16) = v4;
  return v4;
}

uint64_t awd::profile::Condition::IsInitialized(awd::profile::Condition *this)
{
  return 1;
}

void *awd::profile::Condition::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.Condition");
}

void awd::profile::ConditionClause::MergeFrom(awd::profile::ConditionClause *this, const awd::profile::ConditionClause *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
  }
  sub_10013CE24((awd::profile::ConditionClause *)((char *)this + 8), (uint64_t)a2 + 8);
}

void sub_100137CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::ConditionClause::~ConditionClause(awd::profile::ConditionClause *this)
{
  *(void *)this = off_1001BF098;
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
  sub_1000FB750((uint64_t *)this + 1);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::ConditionClause::~ConditionClause(this);

  operator delete();
}

void awd::profile::ConditionClause::New(awd::profile::ConditionClause *this)
{
}

uint64_t awd::profile::ConditionClause::Clear(awd::profile::ConditionClause *this)
{
  uint64_t result = sub_1000FB6E0((uint64_t)this + 8);
  *((_DWORD *)this + 9) = 0;
  return result;
}

uint64_t awd::profile::ConditionClause::MergePartialFromCodedStream(awd::profile::ConditionClause *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (awd::profile::ConditionClause *)((char *)this + 8);
  while (1)
  {
LABEL_2:
    int v6 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v6 >= *((void *)a2 + 2) || *v6 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
    }
    else
    {
      unint64_t TagFallback = *v6;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v6 + 1;
    }
    if (TagFallback == 10)
    {
      while (1)
      {
        int v8 = *((_DWORD *)this + 5);
        uint64_t v9 = *((int *)this + 4);
        if ((int)v9 >= v8)
        {
          if (v8 == *((_DWORD *)this + 6))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v5, v8 + 1);
            int v8 = *((_DWORD *)this + 5);
          }
          *((_DWORD *)this + 5) = v8 + 1;
          operator new();
        }
        uint64_t v10 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v9 + 1;
        int v11 = *(awd::profile::Condition **)(v10 + 8 * v9);
        unsigned int v23 = 0;
        unint64_t v12 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v12 >= *((void *)a2 + 2) || *v12 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v23))return 0; {
        }
          }
        else
        {
          unsigned int v23 = *v12;
          *((void *)a2 + 1) = v12 + 1;
        }
        int v13 = *((_DWORD *)a2 + 14);
        int v14 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v13 + 1;
        if (v13 >= v14) {
          return 0;
        }
        int v15 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v23);
        if (!awd::profile::Condition::MergePartialFromCodedStream(v11, a2, v16) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v15);
        int v17 = *((_DWORD *)a2 + 14);
        BOOL v18 = __OFSUB__(v17, 1);
        int v19 = v17 - 1;
        if (v19 < 0 == v18) {
          *((_DWORD *)a2 + 14) = v19;
        }
        int v20 = (unsigned char *)*((void *)a2 + 1);
        int v21 = (unsigned char *)*((void *)a2 + 2);
        if (v20 >= v21 || *v20 != 10)
        {
          if (v20 == v21 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          goto LABEL_2;
        }
        *((void *)a2 + 1) = v20 + 1;
      }
    }
    if (!TagFallback || (TagFallback & 7) == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::ConditionClause::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*(int *)(this + 16) >= 1)
  {
    uint64_t v5 = this;
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  return this;
}

uint64_t awd::profile::ConditionClause::ByteSize(awd::profile::ConditionClause *this, unint64_t a2)
{
  uint64_t v3 = *((unsigned int *)this + 4);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::Condition::ByteSize(*(awd::profile::Condition **)(*((void *)this + 1) + 8 * v4), a2);
      int v6 = (int)v5;
      if (v5 >= 0x80) {
        int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5, a2);
      }
      else {
        int v7 = 1;
      }
      uint64_t v3 = (v6 + v3 + v7);
      ++v4;
    }
    while (v4 < *((int *)this + 4));
  }
  *((_DWORD *)this + 8) = v3;
  return v3;
}

uint64_t awd::profile::ConditionClause::IsInitialized(awd::profile::ConditionClause *this)
{
  return 1;
}

void *awd::profile::ConditionClause::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.ConditionClause");
}

void awd::profile::TriggerSource::MergeFrom(awd::profile::TriggerSource *this, const awd::profile::TriggerSource *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v16);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerSource *)((char *)this + 32), *((_DWORD *)a2 + 10) + *((_DWORD *)this + 10));
  if (*((int *)a2 + 10) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(const awd::profile::ConditionClause **)(*((void *)a2 + 4) + 8 * v4);
      int v6 = *((_DWORD *)this + 11);
      uint64_t v7 = *((int *)this + 10);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 12))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerSource *)((char *)this + 32), v6 + 1);
          int v6 = *((_DWORD *)this + 11);
        }
        *((_DWORD *)this + 11) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 4);
      *((_DWORD *)this + 10) = v7 + 1;
      awd::profile::ConditionClause::MergeFrom(*(awd::profile::ConditionClause **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 10));
  }
  LOBYTE(v9) = *((unsigned char *)a2 + 68);
  if ((_BYTE)v9)
  {
    if (*((unsigned char *)a2 + 68))
    {
      int v10 = *((_DWORD *)a2 + 4);
      *((_DWORD *)this + 17) |= 1u;
      *((_DWORD *)this + 4) = v10;
      int v9 = *((_DWORD *)a2 + 17);
      if ((v9 & 2) == 0)
      {
LABEL_14:
        if ((v9 & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_20;
      }
    }
    else if ((*((unsigned char *)a2 + 68) & 2) == 0)
    {
      goto LABEL_14;
    }
    uint64_t v11 = *((void *)a2 + 1);
    *((_DWORD *)this + 17) |= 2u;
    *((void *)this + 1) = v11;
    int v9 = *((_DWORD *)a2 + 17);
    if ((v9 & 4) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_21;
    }
LABEL_20:
    int v12 = *((_DWORD *)a2 + 5);
    *((_DWORD *)this + 17) |= 4u;
    *((_DWORD *)this + 5) = v12;
    int v9 = *((_DWORD *)a2 + 17);
    if ((v9 & 8) == 0)
    {
LABEL_16:
      if ((v9 & 0x20) == 0) {
        return;
      }
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v13 = *((void *)a2 + 3);
    *((_DWORD *)this + 17) |= 8u;
    *((void *)this + 3) = v13;
    if ((*((_DWORD *)a2 + 17) & 0x20) == 0) {
      return;
    }
LABEL_22:
    int v14 = (const std::string *)*((void *)a2 + 7);
    *((_DWORD *)this + 17) |= 0x20u;
    int v15 = (std::string *)*((void *)this + 7);
    if (v15 == (std::string *)&wireless_diagnostics::google::protobuf::internal::kEmptyString) {
      operator new();
    }
    std::string::operator=(v15, v14);
  }
}

void sub_10013838C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TriggerSource::~TriggerSource(awd::profile::TriggerSource *this)
{
  *(void *)this = off_1001BF110;
  awd::profile::TriggerSource::SharedDtor(this);
  sub_1000FB750((uint64_t *)this + 4);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TriggerSource::~TriggerSource(this);

  operator delete();
}

void awd::profile::TriggerSource::SharedDtor(awd::profile::TriggerSource *this)
{
  uint64_t v1 = *((void *)this + 7);
  if ((_UNKNOWN *)v1 != &wireless_diagnostics::google::protobuf::internal::kEmptyString && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    operator delete();
  }

  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
}

void awd::profile::TriggerSource::New(awd::profile::TriggerSource *this)
{
}

uint64_t awd::profile::TriggerSource::Clear(awd::profile::TriggerSource *this)
{
  char v2 = *((unsigned char *)this + 68);
  if (v2)
  {
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
    *((void *)this + 3) = 0;
    if ((v2 & 0x20) != 0)
    {
      uint64_t v3 = *((void *)this + 7);
      if ((_UNKNOWN *)v3 != &wireless_diagnostics::google::protobuf::internal::kEmptyString)
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
  }
  uint64_t result = sub_1000FB6E0((uint64_t)this + 32);
  *((_DWORD *)this + 17) = 0;
  return result;
}

uint64_t awd::profile::TriggerSource::MergePartialFromCodedStream(awd::profile::TriggerSource *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (unint64_t *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 16);
  uint64_t v7 = (unsigned int *)((char *)this + 20);
  uint64_t v8 = (unint64_t *)((char *)this + 24);
  int v9 = (awd::profile::TriggerSource *)((char *)this + 32);
  while (2)
  {
    int v10 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v10 >= *((void *)a2 + 2) || *v10 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v10;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v10 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    unsigned int v12 = TagFallback >> 3;
    switch(TagFallback >> 3)
    {
      case 1u:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_31;
        }
        int v15 = (char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        if ((unint64_t)v15 >= v14 || *v15 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v5);
          if (!result) {
            return result;
          }
          unsigned int v16 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unint64_t *v5 = *v15;
          unsigned int v16 = v15 + 1;
          *((void *)a2 + 1) = v16;
        }
        *((_DWORD *)this + 17) |= 2u;
        if ((unint64_t)v16 < v14 && *v16 == 16)
        {
          BOOL v18 = v16 + 1;
          *((void *)a2 + 1) = v18;
          goto LABEL_39;
        }
        continue;
      case 2u:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_31;
        }
        BOOL v18 = (char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
LABEL_39:
        if ((unint64_t)v18 >= v14 || *v18 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          int v21 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v18;
          int v21 = v18 + 1;
          *((void *)a2 + 1) = v21;
        }
        *((_DWORD *)this + 17) |= 1u;
        if ((unint64_t)v21 >= v14 || *v21 != 24) {
          continue;
        }
        int v19 = v21 + 1;
        *((void *)a2 + 1) = v19;
LABEL_47:
        if ((unint64_t)v19 >= v14 || *v19 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v7);
          if (!result) {
            return result;
          }
          int v22 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v7 = *v19;
          int v22 = v19 + 1;
          *((void *)a2 + 1) = v22;
        }
        *((_DWORD *)this + 17) |= 4u;
        if ((unint64_t)v22 >= v14 || *v22 != 32) {
          continue;
        }
        int v20 = v22 + 1;
        *((void *)a2 + 1) = v20;
LABEL_55:
        if ((unint64_t)v20 >= v14 || (char)*v20 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v8);
          if (!result) {
            return result;
          }
          unsigned int v23 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v8 = *v20;
          unsigned int v23 = v20 + 1;
          *((void *)a2 + 1) = v23;
        }
        *((_DWORD *)this + 17) |= 8u;
        if ((int)v14 - (int)v23 >= 2 && *v23 == 130 && v23[1] == 1) {
          goto LABEL_63;
        }
        continue;
      case 3u:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_31;
        }
        int v19 = (char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        goto LABEL_47;
      case 4u:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_31;
        }
        int v20 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        goto LABEL_55;
      default:
        if (v12 != 16)
        {
          if (v12 == 32)
          {
            int v13 = TagFallback & 7;
            if (v13 == 2) {
              goto LABEL_15;
            }
          }
          else
          {
            int v13 = TagFallback & 7;
          }
LABEL_31:
          if (v13 == 4) {
            return 1;
          }
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
          continue;
          }
        }
        int v13 = TagFallback & 7;
        if (v13 != 2) {
          goto LABEL_31;
        }
LABEL_64:
        int v24 = *((_DWORD *)this + 11);
        uint64_t v25 = *((int *)this + 10);
        if ((int)v25 >= v24)
        {
          if (v24 == *((_DWORD *)this + 12))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v9, v24 + 1);
            int v24 = *((_DWORD *)this + 11);
          }
          *((_DWORD *)this + 11) = v24 + 1;
          operator new();
        }
        uint64_t v26 = *((void *)this + 4);
        *((_DWORD *)this + 10) = v25 + 1;
        uint64_t v27 = *(awd::profile::ConditionClause **)(v26 + 8 * v25);
        unsigned int v37 = 0;
        int v28 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v28 >= *((void *)a2 + 2) || *v28 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v37))return 0; {
        }
          }
        else
        {
          unsigned int v37 = *v28;
          *((void *)a2 + 1) = v28 + 1;
        }
        int v29 = *((_DWORD *)a2 + 14);
        int v30 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v29 + 1;
        if (v29 < v30)
        {
          int v31 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v37);
          if (awd::profile::ConditionClause::MergePartialFromCodedStream(v27, a2, v32))
          {
            if (*((unsigned char *)a2 + 36))
            {
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v31);
              int v33 = *((_DWORD *)a2 + 14);
              BOOL v34 = __OFSUB__(v33, 1);
              int v35 = v33 - 1;
              if (v35 < 0 == v34) {
                *((_DWORD *)a2 + 14) = v35;
              }
              unsigned int v23 = (unsigned __int8 *)*((void *)a2 + 1);
              if (*((_DWORD *)a2 + 4) - (int)v23 <= 1 || *v23 != 130) {
                continue;
              }
              int v36 = v23[1];
              if (v36 == 1)
              {
LABEL_63:
                *((void *)a2 + 1) = v23 + 2;
                goto LABEL_64;
              }
              if (v36 == 2)
              {
                *((void *)a2 + 1) = v23 + 2;
LABEL_15:
                *((_DWORD *)this + 17) |= 0x20u;
                if (*((_UNKNOWN **)this + 7) == &wireless_diagnostics::google::protobuf::internal::kEmptyString) {
                  operator new();
                }
                uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
                if (!result) {
                  return result;
                }
                if (*((void *)a2 + 1) == *((void *)a2 + 2)
                  && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                {
                  *((_DWORD *)a2 + 8) = 0;
                  uint64_t result = 1;
                  *((unsigned char *)a2 + 36) = 1;
                  return result;
                }
              }
              continue;
            }
          }
        }
        return 0;
    }
  }
}

uint64_t awd::profile::TriggerSource::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 68);
  if ((v6 & 2) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 8), (unint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 68);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(_DWORD *)(v5 + 16), a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(_DWORD *)(v5 + 20), a2, a4);
  if ((*(_DWORD *)(v5 + 68) & 8) != 0) {
LABEL_5:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(v5 + 24), (unint64_t)a2, a4);
LABEL_6:
  if (*(int *)(v5 + 40) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, *(void *)(*(void *)(v5 + 32) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 40));
  }
  if ((*(unsigned char *)(v5 + 68) & 0x20) != 0)
  {
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  return this;
}

uint64_t awd::profile::TriggerSource::ByteSize(awd::profile::TriggerSource *this, unint64_t a2)
{
  LOBYTE(v3) = *((unsigned char *)this + 68);
  if (!(_BYTE)v3)
  {
    int v4 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)this + 68) & 1) == 0)
  {
    int v4 = 0;
    if ((*((unsigned char *)this + 68) & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
  if (v5 >= 0x80)
  {
    int v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5, a2) + 1;
    int v3 = *((_DWORD *)this + 17);
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v4 = 2;
  if ((v3 & 2) != 0)
  {
LABEL_10:
    v4 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this + 1), a2)+ 1;
    int v3 = *((_DWORD *)this + 17);
  }
LABEL_11:
  if ((v3 & 4) != 0)
  {
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 5);
    if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6, a2) + 1;
      int v3 = *((_DWORD *)this + 17);
    }
    else
    {
      int v7 = 2;
    }
    v4 += v7;
    if ((v3 & 8) == 0)
    {
LABEL_13:
      if ((v3 & 0x20) == 0) {
        goto LABEL_29;
      }
      goto LABEL_20;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_13;
  }
  v4 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this + 3), a2)+ 1;
  if ((*((_DWORD *)this + 17) & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_20:
  uint64_t v8 = *((void *)this + 7);
  int v9 = *(unsigned __int8 *)(v8 + 23);
  char v10 = v9;
  uint64_t v11 = *(void *)(v8 + 8);
  if ((v9 & 0x80u) == 0) {
    unint64_t v12 = *(unsigned __int8 *)(v8 + 23);
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12 >= 0x80)
  {
    int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v12, a2);
    int v9 = *(unsigned __int8 *)(v8 + 23);
    uint64_t v11 = *(void *)(v8 + 8);
    char v10 = *(unsigned char *)(v8 + 23);
  }
  else
  {
    int v13 = 1;
  }
  if (v10 < 0) {
    int v9 = v11;
  }
  v4 += v13 + v9 + 2;
LABEL_29:
  int v14 = *((_DWORD *)this + 10);
  uint64_t v15 = (v4 + 2 * v14);
  if (v14 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      int v17 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConditionClause::ByteSize(*(awd::profile::ConditionClause **)(*((void *)this + 4) + 8 * v16), a2);
      int v18 = (int)v17;
      if (v17 >= 0x80) {
        int v19 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v17, a2);
      }
      else {
        int v19 = 1;
      }
      uint64_t v15 = (v18 + v15 + v19);
      ++v16;
    }
    while (v16 < *((int *)this + 10));
  }
  *((_DWORD *)this + 16) = v15;
  return v15;
}

uint64_t awd::profile::TriggerSource::IsInitialized(awd::profile::TriggerSource *this)
{
  return 1;
}

void *awd::profile::TriggerSource::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.TriggerSource");
}

void awd::profile::TriggerProcessingRule::MergeFrom(awd::profile::TriggerProcessingRule *this, const awd::profile::TriggerProcessingRule *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v16);
  }
  int v4 = *((_DWORD *)a2 + 4);
  if (v4)
  {
    sub_10004BAE8((uint64_t)this + 8, *((_DWORD *)this + 4) + v4);
    memcpy((void *)(*((void *)this + 1) + 4 * *((int *)this + 4)), *((const void **)a2 + 1), 4 * *((int *)a2 + 4));
    *((_DWORD *)this + 4) += *((_DWORD *)a2 + 4);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 24), *((_DWORD *)a2 + 8) + *((_DWORD *)this + 8));
  if (*((int *)a2 + 8) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      int v6 = *(const awd::profile::ConditionClause **)(*((void *)a2 + 3) + 8 * v5);
      int v7 = *((_DWORD *)this + 9);
      uint64_t v8 = *((int *)this + 8);
      if ((int)v8 >= v7)
      {
        if (v7 == *((_DWORD *)this + 10))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 24), v7 + 1);
          int v7 = *((_DWORD *)this + 9);
        }
        *((_DWORD *)this + 9) = v7 + 1;
        operator new();
      }
      uint64_t v9 = *((void *)this + 3);
      *((_DWORD *)this + 8) = v8 + 1;
      awd::profile::ConditionClause::MergeFrom(*(awd::profile::ConditionClause **)(v9 + 8 * v8), v6);
      ++v5;
    }
    while (v5 < *((int *)a2 + 8));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 48), *((_DWORD *)a2 + 14) + *((_DWORD *)this + 14));
  if (*((int *)a2 + 14) >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = *(const awd::profile::ConditionClause **)(*((void *)a2 + 6) + 8 * v10);
      int v12 = *((_DWORD *)this + 15);
      uint64_t v13 = *((int *)this + 14);
      if ((int)v13 >= v12)
      {
        if (v12 == *((_DWORD *)this + 16))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 48), v12 + 1);
          int v12 = *((_DWORD *)this + 15);
        }
        *((_DWORD *)this + 15) = v12 + 1;
        operator new();
      }
      uint64_t v14 = *((void *)this + 6);
      *((_DWORD *)this + 14) = v13 + 1;
      awd::profile::ConditionClause::MergeFrom(*(awd::profile::ConditionClause **)(v14 + 8 * v13), v11);
      ++v10;
    }
    while (v10 < *((int *)a2 + 14));
  }
  if (*((unsigned char *)a2 + 80))
  {
    int v15 = *((_DWORD *)a2 + 18);
    *((_DWORD *)this + 20) |= 1u;
    *((_DWORD *)this + 18) = v15;
  }
}

void sub_100138FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TriggerProcessingRule::~TriggerProcessingRule(awd::profile::TriggerProcessingRule *this)
{
  *(void *)this = off_1001BF188;
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
  sub_1000FB750((uint64_t *)this + 6);
  sub_1000FB750((uint64_t *)this + 3);
  if (*((void *)this + 1)) {
    operator delete[]();
  }

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TriggerProcessingRule::~TriggerProcessingRule(this);

  operator delete();
}

void awd::profile::TriggerProcessingRule::New(awd::profile::TriggerProcessingRule *this)
{
}

uint64_t awd::profile::TriggerProcessingRule::Clear(awd::profile::TriggerProcessingRule *this)
{
  if (*((unsigned char *)this + 80)) {
    *((_DWORD *)this + 18) = 0;
  }
  *((_DWORD *)this + 4) = 0;
  sub_1000FB6E0((uint64_t)this + 24);
  uint64_t result = sub_1000FB6E0((uint64_t)this + 48);
  *((_DWORD *)this + 20) = 0;
  return result;
}

uint64_t awd::profile::TriggerProcessingRule::MergePartialFromCodedStream(awd::profile::TriggerProcessingRule *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (uint64_t *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 72);
  int v7 = (awd::profile::TriggerProcessingRule *)((char *)this + 48);
  uint64_t v8 = (awd::profile::TriggerProcessingRule *)((char *)this + 24);
LABEL_2:
  while (2)
  {
    uint64_t v9 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v9 >= *((void *)a2 + 2) || *v9 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v9;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v9 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_19;
        }
        uint64_t v13 = (char *)*((void *)a2 + 1);
        unint64_t v12 = *((void *)a2 + 2);
        if ((unint64_t)v13 >= v12 || *v13 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          uint64_t v14 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v12 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v13;
          uint64_t v14 = v13 + 1;
          *((void *)a2 + 1) = v14;
        }
        *((_DWORD *)this + 20) |= 1u;
        if ((unint64_t)v14 >= v12 || *v14 != 18) {
          continue;
        }
        goto LABEL_28;
      case 2u:
        int v11 = TagFallback & 7;
        if (v11 != 2) {
          goto LABEL_19;
        }
        while (2)
        {
          int v18 = *((_DWORD *)this + 15);
          uint64_t v19 = *((int *)this + 14);
          if ((int)v19 >= v18)
          {
            if (v18 == *((_DWORD *)this + 16))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7, v18 + 1);
              int v18 = *((_DWORD *)this + 15);
            }
            *((_DWORD *)this + 15) = v18 + 1;
            operator new();
          }
          uint64_t v20 = *((void *)this + 6);
          *((_DWORD *)this + 14) = v19 + 1;
          int v21 = *(awd::profile::ConditionClause **)(v20 + 8 * v19);
          unsigned int v53 = 0;
          int v22 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v22 >= *((void *)a2 + 2) || *v22 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v53))return 0; {
          }
            }
          else
          {
            unsigned int v53 = *v22;
            *((void *)a2 + 1) = v22 + 1;
          }
          int v23 = *((_DWORD *)a2 + 14);
          int v24 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v23 + 1;
          if (v23 >= v24) {
            return 0;
          }
          int v25 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v53);
          if (!awd::profile::ConditionClause::MergePartialFromCodedStream(v21, a2, v26)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v25);
          int v27 = *((_DWORD *)a2 + 14);
          BOOL v28 = __OFSUB__(v27, 1);
          int v29 = v27 - 1;
          if (v29 < 0 == v28) {
            *((_DWORD *)a2 + 14) = v29;
          }
          uint64_t v14 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v15 = *((void *)a2 + 2);
          if ((unint64_t)v14 < v15)
          {
            int v30 = *v14;
            if (v30 == 18)
            {
LABEL_28:
              *((void *)a2 + 1) = v14 + 1;
              continue;
            }
            goto LABEL_45;
          }
          goto LABEL_2;
        }
      case 3u:
        int v11 = TagFallback & 7;
        if (v11 == 2)
        {
          uint64_t result = sub_100128694(a2, (uint64_t)v5);
          if (!result) {
            return result;
          }
          while (1)
          {
            uint64_t v14 = (unsigned char *)*((void *)a2 + 1);
            unint64_t v15 = *((void *)a2 + 2);
            if ((unint64_t)v14 >= v15) {
              goto LABEL_2;
            }
            int v30 = *v14;
            if (v30 == 34) {
              break;
            }
LABEL_45:
            if (v30 != 24) {
              goto LABEL_2;
            }
            uint64_t v16 = v14 + 1;
            *((void *)a2 + 1) = v16;
LABEL_47:
            unsigned int v52 = 0;
            if ((unint64_t)v16 >= v15 || *v16 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v52))return 0; {
            }
              }
            else
            {
              unsigned int v52 = *v16;
              *((void *)a2 + 1) = v16 + 1;
            }
            int v31 = *((_DWORD *)this + 4);
            if (v31 == *((_DWORD *)this + 5))
            {
              sub_10004BAE8((uint64_t)v5, v31 + 1);
              int v31 = *((_DWORD *)this + 4);
            }
            unsigned int v32 = v52;
            uint64_t v33 = *((void *)this + 1);
            *((_DWORD *)this + 4) = v31 + 1;
            *(_DWORD *)(v33 + 4 * v31) = v32;
            int v34 = *((_DWORD *)this + 5) - *((_DWORD *)this + 4);
            if (v34 >= 1)
            {
              int v35 = v34 + 1;
              do
              {
                int v36 = (unsigned char *)*((void *)a2 + 1);
                unint64_t v37 = *((void *)a2 + 2);
                if ((unint64_t)v36 >= v37 || *v36 != 24) {
                  break;
                }
                *((void *)a2 + 1) = v36 + 1;
                if ((unint64_t)(v36 + 1) >= v37 || (char)v36[1] < 0)
                {
                  if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v52))return 0; {
                  unsigned int v38 = v52;
                  }
                  uint64_t v33 = *v5;
                }
                else
                {
                  unsigned int v38 = v36[1];
                  unsigned int v52 = v38;
                  *((void *)a2 + 1) = v36 + 2;
                }
                uint64_t v39 = *((int *)this + 4);
                *((_DWORD *)this + 4) = v39 + 1;
                *(_DWORD *)(v33 + 4 * v39) = v38;
                --v35;
              }
              while (v35 > 1);
            }
          }
          do
          {
            *((void *)a2 + 1) = v14 + 1;
LABEL_66:
            int v40 = *((_DWORD *)this + 9);
            uint64_t v41 = *((int *)this + 8);
            if ((int)v41 >= v40)
            {
              if (v40 == *((_DWORD *)this + 10))
              {
                wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v8, v40 + 1);
                int v40 = *((_DWORD *)this + 9);
              }
              *((_DWORD *)this + 9) = v40 + 1;
              operator new();
            }
            uint64_t v42 = *((void *)this + 3);
            *((_DWORD *)this + 8) = v41 + 1;
            v43 = *(awd::profile::ConditionClause **)(v42 + 8 * v41);
            unsigned int v54 = 0;
            v44 = (char *)*((void *)a2 + 1);
            if ((unint64_t)v44 >= *((void *)a2 + 2) || *v44 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v54))return 0; {
            }
              }
            else
            {
              unsigned int v54 = *v44;
              *((void *)a2 + 1) = v44 + 1;
            }
            int v45 = *((_DWORD *)a2 + 14);
            int v46 = *((_DWORD *)a2 + 15);
            *((_DWORD *)a2 + 14) = v45 + 1;
            if (v45 >= v46) {
              return 0;
            }
            int v47 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v54);
            if (!awd::profile::ConditionClause::MergePartialFromCodedStream(v43, a2, v48)
              || !*((unsigned char *)a2 + 36))
            {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v47);
            int v49 = *((_DWORD *)a2 + 14);
            BOOL v28 = __OFSUB__(v49, 1);
            int v50 = v49 - 1;
            if (v50 < 0 == v28) {
              *((_DWORD *)a2 + 14) = v50;
            }
            uint64_t v14 = (unsigned char *)*((void *)a2 + 1);
            int v51 = (unsigned char *)*((void *)a2 + 2);
          }
          while (v14 < v51 && *v14 == 34);
          if (v14 == v51 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        if ((TagFallback & 7) == 0)
        {
          uint64_t v16 = (char *)*((void *)a2 + 1);
          unint64_t v15 = *((void *)a2 + 2);
          goto LABEL_47;
        }
LABEL_19:
        if (v11 != 4)
        {
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
          continue;
          }
        }
        return 1;
      case 4u:
        int v11 = TagFallback & 7;
        if (v11 != 2) {
          goto LABEL_19;
        }
        goto LABEL_66;
      default:
        int v11 = TagFallback & 7;
        goto LABEL_19;
    }
  }
}

uint64_t awd::profile::TriggerProcessingRule::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  if (*(unsigned char *)(this + 80)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(this + 72), a2, a4);
  }
  if (*(int *)(v5 + 56) >= 1)
  {
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(*(void *)(v5 + 48) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 56));
  }
  if (*(int *)(v5 + 16) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(_DWORD *)(*(void *)(v5 + 8) + 4 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 16));
  }
  if (*(int *)(v5 + 32) >= 1)
  {
    uint64_t v8 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(*(void *)(v5 + 24) + 8 * v8++), a2, a4);
    while (v8 < *(int *)(v5 + 32));
  }
  return this;
}

uint64_t awd::profile::TriggerProcessingRule::ByteSize(awd::profile::TriggerProcessingRule *this, unint64_t a2)
{
  if (*((unsigned char *)this + 80))
  {
    int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 18);
    if (v4 >= 0x80) {
      int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4, a2) + 1;
    }
    else {
      int v3 = 2;
    }
  }
  else
  {
    int v3 = 0;
  }
  int v5 = *((_DWORD *)this + 4);
  if (v5 < 1)
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    int v7 = 0;
    do
    {
      uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 1)
                                                                                            + 4 * v6);
      if (v8 >= 0x80)
      {
        int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8, a2);
        int v5 = *((_DWORD *)this + 4);
      }
      else
      {
        int v9 = 1;
      }
      v7 += v9;
      ++v6;
    }
    while (v6 < v5);
  }
  int v10 = *((_DWORD *)this + 8);
  int v11 = v7 + v10 + v3 + v5;
  if (v10 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConditionClause::ByteSize(*(awd::profile::ConditionClause **)(*((void *)this + 3) + 8 * v12), a2);
      int v14 = (int)v13;
      if (v13 >= 0x80) {
        int v15 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v13, a2);
      }
      else {
        int v15 = 1;
      }
      v11 += v14 + v15;
      ++v12;
    }
    while (v12 < *((int *)this + 8));
  }
  int v16 = *((_DWORD *)this + 14);
  uint64_t v17 = (v16 + v11);
  if (v16 >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConditionClause::ByteSize(*(awd::profile::ConditionClause **)(*((void *)this + 6) + 8 * v18), a2);
      int v20 = (int)v19;
      if (v19 >= 0x80) {
        int v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v19, a2);
      }
      else {
        int v21 = 1;
      }
      uint64_t v17 = (v20 + v17 + v21);
      ++v18;
    }
    while (v18 < *((int *)this + 14));
  }
  *((_DWORD *)this + 19) = v17;
  return v17;
}

uint64_t awd::profile::TriggerProcessingRule::IsInitialized(awd::profile::TriggerProcessingRule *this)
{
  return 1;
}

void *awd::profile::TriggerProcessingRule::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.TriggerProcessingRule");
}

void awd::profile::AggregationSpec::MergeFrom(awd::profile::AggregationSpec *this, const awd::profile::AggregationSpec *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 24);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 24))
    {
      int v5 = *((_DWORD *)a2 + 4);
      *((_DWORD *)this + 6) |= 1u;
      *((_DWORD *)this + 4) = v5;
      int v4 = *((_DWORD *)a2 + 6);
    }
    if ((v4 & 2) != 0)
    {
      uint64_t v6 = (const std::string *)*((void *)a2 + 1);
      *((_DWORD *)this + 6) |= 2u;
      int v7 = (std::string *)*((void *)this + 1);
      if (v7 == (std::string *)&wireless_diagnostics::google::protobuf::internal::kEmptyString) {
        operator new();
      }
      std::string::operator=(v7, v6);
    }
  }
}

void sub_100139A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::AggregationSpec::~AggregationSpec(awd::profile::AggregationSpec *this)
{
  *(void *)this = off_1001BF200;
  awd::profile::AggregationSpec::SharedDtor(this);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::AggregationSpec::~AggregationSpec(this);

  operator delete();
}

void awd::profile::AggregationSpec::SharedDtor(awd::profile::AggregationSpec *this)
{
  uint64_t v1 = *((void *)this + 1);
  if ((_UNKNOWN *)v1 != &wireless_diagnostics::google::protobuf::internal::kEmptyString && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    operator delete();
  }

  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
}

void awd::profile::AggregationSpec::New(awd::profile::AggregationSpec *this)
{
}

uint64_t awd::profile::AggregationSpec::Clear(uint64_t this)
{
  char v1 = *(unsigned char *)(this + 24);
  if (v1)
  {
    *(_DWORD *)(this + 16) = 0;
    if ((v1 & 2) != 0)
    {
      uint64_t v2 = *(void *)(this + 8);
      if ((_UNKNOWN *)v2 != &wireless_diagnostics::google::protobuf::internal::kEmptyString)
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
  }
  *(_DWORD *)(this + 24) = 0;
  return this;
}

uint64_t awd::profile::AggregationSpec::MergePartialFromCodedStream(awd::profile::AggregationSpec *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  int v5 = (unsigned int *)((char *)this + 16);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v6 >= *((void *)a2 + 2) || *v6 < 0)
        {
          unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
          *((_DWORD *)a2 + 8) = TagFallback;
          if (!TagFallback) {
            return 1;
          }
        }
        else
        {
          unint64_t TagFallback = *v6;
          *((_DWORD *)a2 + 8) = TagFallback;
          *((void *)a2 + 1) = v6 + 1;
          if (!TagFallback) {
            return 1;
          }
        }
        if (TagFallback >> 3 != 1) {
          break;
        }
        int v8 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_16;
        }
        int v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          uint64_t v12 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v5 = *v11;
          uint64_t v12 = v11 + 1;
          *((void *)a2 + 1) = v12;
        }
        int v9 = *((_DWORD *)this + 6) | 1;
        *((_DWORD *)this + 6) = v9;
        if ((unint64_t)v12 < v10 && *v12 == 18)
        {
          *((void *)a2 + 1) = v12 + 1;
          goto LABEL_24;
        }
      }
      if (TagFallback >> 3 != 2) {
        break;
      }
      int v8 = TagFallback & 7;
      if (v8 != 2) {
        goto LABEL_16;
      }
      int v9 = *((_DWORD *)this + 6);
LABEL_24:
      *((_DWORD *)this + 6) = v9 | 2;
      if (*((_UNKNOWN **)this + 1) == &wireless_diagnostics::google::protobuf::internal::kEmptyString) {
        operator new();
      }
      uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
      if (!result) {
        return result;
      }
      if (*((void *)a2 + 1) == *((void *)a2 + 2)
        && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
      {
        *((_DWORD *)a2 + 8) = 0;
        uint64_t result = 1;
        *((unsigned char *)a2 + 36) = 1;
        return result;
      }
    }
    int v8 = TagFallback & 7;
LABEL_16:
    if (v8 == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::AggregationSpec::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v4 = this;
  int v5 = *(_DWORD *)(this + 24);
  if (v5)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(this + 16), a2, a4);
    int v5 = *(_DWORD *)(v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  return this;
}

uint64_t awd::profile::AggregationSpec::ByteSize(awd::profile::AggregationSpec *this, unsigned int a2)
{
  char v3 = *((unsigned char *)this + 24);
  if (v3)
  {
    if (*((unsigned char *)this + 24))
    {
      int v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
      if (v5 >= 0x80)
      {
        uint64_t v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5, a2)
           + 1;
        if ((*((_DWORD *)this + 6) & 2) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v4 = 2;
        if ((v3 & 2) == 0) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      uint64_t v4 = 0;
      if ((*((unsigned char *)this + 24) & 2) == 0) {
        goto LABEL_19;
      }
    }
    uint64_t v6 = *((void *)this + 1);
    int v7 = *(unsigned __int8 *)(v6 + 23);
    char v8 = v7;
    uint64_t v9 = *(void *)(v6 + 8);
    if ((v7 & 0x80u) == 0) {
      unint64_t v10 = *(unsigned __int8 *)(v6 + 23);
    }
    else {
      unint64_t v10 = v9;
    }
    if (v10 >= 0x80)
    {
      int v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v10, a2);
      int v7 = *(unsigned __int8 *)(v6 + 23);
      uint64_t v9 = *(void *)(v6 + 8);
      char v8 = *(unsigned char *)(v6 + 23);
    }
    else
    {
      int v11 = 1;
    }
    if (v8 < 0) {
      int v7 = v9;
    }
    uint64_t v4 = (v4 + v11 + v7 + 1);
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_19:
  *((_DWORD *)this + 5) = v4;
  return v4;
}

uint64_t awd::profile::AggregationSpec::IsInitialized(awd::profile::AggregationSpec *this)
{
  return 1;
}

void *awd::profile::AggregationSpec::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.AggregationSpec");
}

void awd::profile::MetricFileSpec::MergeFrom(awd::profile::MetricFileSpec *this, const awd::profile::MetricFileSpec *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 36);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 36))
    {
      int v6 = *((_DWORD *)a2 + 2);
      *((_DWORD *)this + 9) |= 1u;
      *((_DWORD *)this + 2) = v6;
      int v4 = *((_DWORD *)a2 + 9);
      if ((v4 & 2) == 0)
      {
LABEL_6:
        if ((v4 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    else if ((*((unsigned char *)a2 + 36) & 2) == 0)
    {
      goto LABEL_6;
    }
    int v7 = *((_DWORD *)a2 + 3);
    *((_DWORD *)this + 9) |= 2u;
    *((_DWORD *)this + 3) = v7;
    int v4 = *((_DWORD *)a2 + 9);
    if ((v4 & 4) == 0)
    {
LABEL_7:
      if ((v4 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
LABEL_13:
    int v8 = *((_DWORD *)a2 + 4);
    *((_DWORD *)this + 9) |= 4u;
    *((_DWORD *)this + 4) = v8;
    int v4 = *((_DWORD *)a2 + 9);
    if ((v4 & 8) == 0)
    {
LABEL_8:
      if ((v4 & 0x10) == 0) {
        return;
      }
      goto LABEL_9;
    }
LABEL_14:
    char v9 = *((unsigned char *)a2 + 20);
    *((_DWORD *)this + 9) |= 8u;
    *((unsigned char *)this + 20) = v9;
    if ((*((_DWORD *)a2 + 9) & 0x10) == 0) {
      return;
    }
LABEL_9:
    uint64_t v5 = *((void *)a2 + 3);
    *((_DWORD *)this + 9) |= 0x10u;
    *((void *)this + 3) = v5;
  }
}

void sub_10013A008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::MetricFileSpec::~MetricFileSpec(awd::profile::MetricFileSpec *this)
{
  *(void *)this = off_1001BF278;
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::MetricFileSpec::~MetricFileSpec(this);

  operator delete();
}

void awd::profile::MetricFileSpec::New(awd::profile::MetricFileSpec *this)
{
}

uint64_t awd::profile::MetricFileSpec::Clear(uint64_t this)
{
  if (*(unsigned char *)(this + 36))
  {
    *(void *)(this + 8) = &_mh_execute_header;
    *(_DWORD *)(this + 16) = 0;
    *(unsigned char *)(this + 20) = 0;
    *(void *)(this + 24) = 0;
  }
  *(_DWORD *)(this + 36) = 0;
  return this;
}

uint64_t awd::profile::MetricFileSpec::MergePartialFromCodedStream(awd::profile::MetricFileSpec *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (unsigned int *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 16);
  int v7 = (unint64_t *)((char *)this + 24);
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
          goto LABEL_22;
        }
        uint64_t v12 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v12 >= v11 || *v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          uint64_t v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v5 = *v12;
          uint64_t v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 9) |= 1u;
        if ((unint64_t)v13 < v11 && *v13 == 16)
        {
          int v16 = v13 + 1;
          *((void *)a2 + 1) = v16;
          goto LABEL_30;
        }
        continue;
      case 2u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        int v16 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
LABEL_30:
        unsigned int v27 = 0;
        if ((unint64_t)v16 >= v11 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v27);
          if (!result) {
            return result;
          }
          unsigned int v19 = v27;
        }
        else
        {
          unsigned int v19 = *v16;
          *((void *)a2 + 1) = v16 + 1;
        }
        if (v19 - 1 <= 2)
        {
          *((_DWORD *)this + 9) |= 2u;
          *((_DWORD *)this + 3) = v19;
        }
        int v20 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        if ((unint64_t)v20 >= v14 || *v20 != 24) {
          continue;
        }
        uint64_t v17 = v20 + 1;
        *((void *)a2 + 1) = v17;
LABEL_40:
        if ((unint64_t)v17 >= v14 || *v17 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          int v21 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v17;
          int v21 = v17 + 1;
          *((void *)a2 + 1) = v21;
        }
        *((_DWORD *)this + 9) |= 4u;
        if ((unint64_t)v21 >= v14 || *v21 != 32) {
          continue;
        }
        uint64_t v18 = v21 + 1;
        *((void *)a2 + 1) = v18;
LABEL_48:
        unsigned int v26 = 0;
        if ((unint64_t)v18 >= v14 || (char)*v18 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v26);
          if (!result) {
            return result;
          }
          unsigned int v22 = v26;
          int v23 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v22 = *v18;
          int v23 = v18 + 1;
          *((void *)a2 + 1) = v23;
        }
        *((unsigned char *)this + 20) = v22 != 0;
        *((_DWORD *)this + 9) |= 8u;
        if ((int)v14 - (int)v23 < 2 || *v23 != 128 || v23[1] != 1) {
          continue;
        }
        int v15 = (char *)(v23 + 2);
        *((void *)a2 + 1) = v15;
        goto LABEL_57;
      case 3u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v17 = (char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        goto LABEL_40;
      case 4u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v18 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        goto LABEL_48;
      default:
        if (TagFallback >> 3 == 16)
        {
          int v10 = TagFallback & 7;
          if ((TagFallback & 7) != 0) {
            goto LABEL_22;
          }
          int v15 = (char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
LABEL_57:
          if ((unint64_t)v15 >= v14 || *v15 < 0)
          {
            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v7);
            if (!result) {
              return result;
            }
            int v24 = (unsigned __int8 *)*((void *)a2 + 1);
            unint64_t v14 = *((void *)a2 + 2);
          }
          else
          {
            *int v7 = *v15;
            int v24 = (unsigned __int8 *)(v15 + 1);
            *((void *)a2 + 1) = v24;
          }
          *((_DWORD *)this + 9) |= 0x10u;
          if (v24 == (unsigned __int8 *)v14 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        int v10 = TagFallback & 7;
LABEL_22:
        if (v10 != 4)
        {
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
          continue;
          }
        }
        return 1;
    }
  }
}

uint64_t awd::profile::MetricFileSpec::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 36);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(this + 8), a2, a4);
    int v6 = *(_DWORD *)(v5 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(_DWORD *)(v5 + 12), (int)a2, a4);
  int v6 = *(_DWORD *)(v5 + 36);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned __int8 *)(v5 + 20), (BOOL)a2, a4);
    if ((*(_DWORD *)(v5 + 36) & 0x10) == 0) {
      return this;
    }
    goto LABEL_11;
  }
LABEL_9:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(_DWORD *)(v5 + 16), a2, a4);
  int v6 = *(_DWORD *)(v5 + 36);
  if ((v6 & 8) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v6 & 0x10) == 0) {
    return this;
  }
LABEL_11:
  uint64_t v7 = *(void *)(v5 + 24);

  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, v7, (unint64_t)a2, a4);
}

uint64_t awd::profile::MetricFileSpec::ByteSize(awd::profile::MetricFileSpec *this, unint64_t a2)
{
  LOBYTE(v3) = *((unsigned char *)this + 36);
  if (!(_BYTE)v3)
  {
    uint64_t v4 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)this + 36) & 1) == 0)
  {
    LODWORD(v4) = 0;
    if ((*((unsigned char *)this + 36) & 2) == 0) {
      goto LABEL_16;
    }
LABEL_10:
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if ((v6 & 0x80000000) != 0)
    {
      int v7 = 11;
    }
    else if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6, a2) + 1;
      int v3 = *((_DWORD *)this + 9);
    }
    else
    {
      int v7 = 2;
    }
    LODWORD(v4) = v7 + v4;
    goto LABEL_16;
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if (v5 < 0x80)
  {
    LODWORD(v4) = 2;
    if ((v3 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  LODWORD(v4) = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5, a2) + 1;
  int v3 = *((_DWORD *)this + 9);
  if ((v3 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_16:
  if ((v3 & 4) != 0)
  {
    int v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
    if (v8 >= 0x80)
    {
      int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8, a2) + 1;
      int v3 = *((_DWORD *)this + 9);
    }
    else
    {
      int v9 = 2;
    }
    LODWORD(v4) = v9 + v4;
  }
  if ((v3 & 8) != 0) {
    uint64_t v4 = (v4 + 2);
  }
  else {
    uint64_t v4 = v4;
  }
  if ((v3 & 0x10) != 0) {
    uint64_t v4 = v4
  }
       + wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this + 3), a2)+ 2;
LABEL_26:
  *((_DWORD *)this + 8) = v4;
  return v4;
}

uint64_t awd::profile::MetricFileSpec::IsInitialized(awd::profile::MetricFileSpec *this)
{
  return 1;
}

void *awd::profile::MetricFileSpec::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.MetricFileSpec");
}

BOOL awd::profile::TaskingCriteria_BuildType_IsValid(awd::profile *this)
{
  return (this - 1) < 4;
}

void awd::profile::TaskingCriteria::MergeFrom(awd::profile::TaskingCriteria *this, const awd::profile::TaskingCriteria *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
  }
  int v4 = *((_DWORD *)a2 + 4);
  if (v4)
  {
    sub_10004BAE8((uint64_t)this + 8, *((_DWORD *)this + 4) + v4);
    memcpy((void *)(*((void *)this + 1) + 4 * *((int *)this + 4)), *((const void **)a2 + 1), 4 * *((int *)a2 + 4));
    *((_DWORD *)this + 4) += *((_DWORD *)a2 + 4);
  }
}

void sub_10013A734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TaskingCriteria::~TaskingCriteria(awd::profile::TaskingCriteria *this)
{
  *(void *)this = off_1001BF2F0;
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
  if (*((void *)this + 1)) {
    operator delete[]();
  }

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TaskingCriteria::~TaskingCriteria(this);

  operator delete();
}

void awd::profile::TaskingCriteria::New(awd::profile::TaskingCriteria *this)
{
}

uint64_t awd::profile::TaskingCriteria::Clear(uint64_t this)
{
  *(_DWORD *)(this + 16) = 0;
  *(_DWORD *)(this + 28) = 0;
  return this;
}

uint64_t awd::profile::TaskingCriteria::MergePartialFromCodedStream(awd::profile::TaskingCriteria *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t v5 = (char *)this + 8;
  while (1)
  {
    while (1)
    {
      int v6 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v6 >= *((void *)a2 + 2) || *v6 < 0)
      {
        unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
        *((_DWORD *)a2 + 8) = TagFallback;
        if (!TagFallback) {
          return 1;
        }
      }
      else
      {
        unint64_t TagFallback = *v6;
        *((_DWORD *)a2 + 8) = TagFallback;
        *((void *)a2 + 1) = v6 + 1;
        if (!TagFallback) {
          return 1;
        }
      }
      int v8 = TagFallback & 7;
      if ((TagFallback & 0xFFFFFFF8) == 8) {
        break;
      }
LABEL_10:
      if (v8 == 4) {
        return 1;
      }
      if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
    }
      }
    if ((TagFallback & 7) != 0) {
      break;
    }
    int v10 = (char *)*((void *)a2 + 1);
    int v9 = (char *)*((void *)a2 + 2);
    while (1)
    {
      unsigned int v16 = 0;
      if (v10 >= v9 || *v10 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v16);
        if (!result) {
          return result;
        }
        unsigned int v11 = v16;
      }
      else
      {
        unsigned int v11 = *v10;
        *((void *)a2 + 1) = v10 + 1;
      }
      if (v11 - 1 <= 3)
      {
        int v12 = *((_DWORD *)this + 4);
        if (v12 == *((_DWORD *)this + 5))
        {
          sub_10004BAE8((uint64_t)v5, v12 + 1);
          int v12 = *((_DWORD *)this + 4);
        }
        uint64_t v13 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v12 + 1;
        *(_DWORD *)(v13 + 4 * v12) = v11;
      }
LABEL_25:
      unint64_t v14 = (char *)*((void *)a2 + 1);
      int v9 = (char *)*((void *)a2 + 2);
      if (v14 >= v9 || *v14 != 8) {
        break;
      }
      int v10 = v14 + 1;
      *((void *)a2 + 1) = v10;
    }
    if (v14 == v9 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
    {
      *((_DWORD *)a2 + 8) = 0;
      uint64_t result = 1;
      *((unsigned char *)a2 + 36) = 1;
      return result;
    }
  }
  if (v8 != 2) {
    goto LABEL_10;
  }
  uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline();
  if (result) {
    goto LABEL_25;
  }
  return result;
}

uint64_t awd::profile::TaskingCriteria::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*(int *)(this + 16) >= 1)
  {
    int v4 = (int)a2;
    uint64_t v5 = this;
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(*(void *)(v5 + 8) + 4 * v6++), v4, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  return this;
}

uint64_t awd::profile::TaskingCriteria::ByteSize(awd::profile::TaskingCriteria *this, unsigned int a2)
{
  int v3 = *((_DWORD *)this + 4);
  if (v3 < 1)
  {
    int v5 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 1)
                                                                                            + 4 * v4);
      if ((v6 & 0x80000000) != 0)
      {
        int v7 = 10;
      }
      else if (v6 >= 0x80)
      {
        int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6, a2);
        int v3 = *((_DWORD *)this + 4);
      }
      else
      {
        int v7 = 1;
      }
      v5 += v7;
      ++v4;
    }
    while (v4 < v3);
  }
  uint64_t result = (v3 + v5);
  *((_DWORD *)this + 6) = result;
  return result;
}

uint64_t awd::profile::TaskingCriteria::IsInitialized(awd::profile::TaskingCriteria *this)
{
  return 1;
}

void *awd::profile::TaskingCriteria::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.TaskingCriteria");
}

awd::profile::DeviceConfiguration *awd::profile::DeviceConfiguration::DeviceConfiguration(awd::profile::DeviceConfiguration *this, const awd::profile::DeviceConfiguration *a2)
{
  *((void *)this + 1) = 0;
  *(void *)this = off_1001BF368;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 28) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((_DWORD *)this + 34) = 0;
  *((void *)this + 19) = 0;
  *((_DWORD *)this + 42) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 23) = 0;
  *((_DWORD *)this + 48) = 0;
  *((_DWORD *)this + 8) = 0;
  *((unsigned char *)this + 36) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 8) = &wireless_diagnostics::google::protobuf::internal::kEmptyString;
  *((void *)this + 18) = 0;
  *((_DWORD *)this + 52) = 0;
  awd::profile::DeviceConfiguration::MergeFrom(this, a2);
  return this;
}

void sub_10013ABEC(_Unwind_Exception *a1)
{
  int v9 = v6;
  sub_1000FB750(v9);
  sub_1000FB750(v8);
  sub_1000FB750(v7);
  sub_1000FB750(v5);
  sub_1000FB750(v4);
  sub_1000FB750(v3);
  sub_1000FB750(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::DeviceConfiguration::MergeFrom(awd::profile::DeviceConfiguration *this, const awd::profile::DeviceConfiguration *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v43);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 8), *((_DWORD *)a2 + 4) + *((_DWORD *)this + 4));
  if (*((int *)a2 + 4) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *(const awd::profile::ComponentConfiguration **)(*((void *)a2 + 1) + 8 * v4);
      int v6 = *((_DWORD *)this + 5);
      uint64_t v7 = *((int *)this + 4);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 6))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 8), v6 + 1);
          int v6 = *((_DWORD *)this + 5);
        }
        *((_DWORD *)this + 5) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 1);
      *((_DWORD *)this + 4) = v7 + 1;
      awd::profile::ComponentConfiguration::MergeFrom(*(awd::profile::ComponentConfiguration **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 4));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 40), *((_DWORD *)a2 + 12) + *((_DWORD *)this + 12));
  if (*((int *)a2 + 12) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = *(const awd::profile::TimerSpec **)(*((void *)a2 + 5) + 8 * v9);
      int v11 = *((_DWORD *)this + 13);
      uint64_t v12 = *((int *)this + 12);
      if ((int)v12 >= v11)
      {
        if (v11 == *((_DWORD *)this + 14))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 40), v11 + 1);
          int v11 = *((_DWORD *)this + 13);
        }
        *((_DWORD *)this + 13) = v11 + 1;
        operator new();
      }
      uint64_t v13 = *((void *)this + 5);
      *((_DWORD *)this + 12) = v12 + 1;
      awd::profile::TimerSpec::MergeFrom(*(awd::profile::TimerSpec **)(v13 + 8 * v12), v10);
      ++v9;
    }
    while (v9 < *((int *)a2 + 12));
  }
  sub_10013CF48((awd::profile::DeviceConfiguration *)((char *)this + 72), (uint64_t)a2 + 72);
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 96), *((_DWORD *)a2 + 26) + *((_DWORD *)this + 26));
  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      int v15 = *(const awd::profile::TriggerSource **)(*((void *)a2 + 12) + 8 * v14);
      int v16 = *((_DWORD *)this + 27);
      uint64_t v17 = *((int *)this + 26);
      if ((int)v17 >= v16)
      {
        if (v16 == *((_DWORD *)this + 28))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 96), v16 + 1);
          int v16 = *((_DWORD *)this + 27);
        }
        *((_DWORD *)this + 27) = v16 + 1;
        operator new();
      }
      uint64_t v18 = *((void *)this + 12);
      *((_DWORD *)this + 26) = v17 + 1;
      awd::profile::TriggerSource::MergeFrom(*(awd::profile::TriggerSource **)(v18 + 8 * v17), v15);
      ++v14;
    }
    while (v14 < *((int *)a2 + 26));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 120), *((_DWORD *)a2 + 32) + *((_DWORD *)this + 32));
  if (*((int *)a2 + 32) >= 1)
  {
    uint64_t v19 = 0;
    do
    {
      int v20 = *(const awd::profile::TriggerProcessingRule **)(*((void *)a2 + 15) + 8 * v19);
      int v21 = *((_DWORD *)this + 33);
      uint64_t v22 = *((int *)this + 32);
      if ((int)v22 >= v21)
      {
        if (v21 == *((_DWORD *)this + 34))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 120), v21 + 1);
          int v21 = *((_DWORD *)this + 33);
        }
        *((_DWORD *)this + 33) = v21 + 1;
        operator new();
      }
      uint64_t v23 = *((void *)this + 15);
      *((_DWORD *)this + 32) = v22 + 1;
      awd::profile::TriggerProcessingRule::MergeFrom(*(awd::profile::TriggerProcessingRule **)(v23 + 8 * v22), v20);
      ++v19;
    }
    while (v19 < *((int *)a2 + 32));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 152), *((_DWORD *)a2 + 40) + *((_DWORD *)this + 40));
  if (*((int *)a2 + 40) >= 1)
  {
    uint64_t v24 = 0;
    do
    {
      int v25 = *(const awd::profile::AggregationSpec **)(*((void *)a2 + 19) + 8 * v24);
      int v26 = *((_DWORD *)this + 41);
      uint64_t v27 = *((int *)this + 40);
      if ((int)v27 >= v26)
      {
        if (v26 == *((_DWORD *)this + 42))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 152), v26 + 1);
          int v26 = *((_DWORD *)this + 41);
        }
        *((_DWORD *)this + 41) = v26 + 1;
        operator new();
      }
      uint64_t v28 = *((void *)this + 19);
      *((_DWORD *)this + 40) = v27 + 1;
      awd::profile::AggregationSpec::MergeFrom(*(awd::profile::AggregationSpec **)(v28 + 8 * v27), v25);
      ++v24;
    }
    while (v24 < *((int *)a2 + 40));
  }
  int v29 = (std::string *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 176), *((_DWORD *)a2 + 46) + *((_DWORD *)this + 46));
  if (*((int *)a2 + 46) >= 1)
  {
    uint64_t v30 = 0;
    do
    {
      int v31 = *(const awd::profile::DeviceConfiguration **)(*((void *)a2 + 22) + 8 * v30);
      int v32 = *((_DWORD *)this + 47);
      uint64_t v33 = *((int *)this + 46);
      if ((int)v33 >= v32)
      {
        if (v32 == *((_DWORD *)this + 48))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 176), v32 + 1);
          int v32 = *((_DWORD *)this + 47);
        }
        *((_DWORD *)this + 47) = v32 + 1;
        sub_10013CBD0();
      }
      uint64_t v34 = *((void *)this + 22);
      *((_DWORD *)this + 46) = v33 + 1;
      int v29 = (std::string *)awd::profile::DeviceConfiguration::MergeFrom(*(awd::profile::DeviceConfiguration **)(v34 + 8 * v33), v31);
      ++v30;
    }
    while (v30 < *((int *)a2 + 46));
  }
  int v35 = *((_DWORD *)a2 + 52);
  if (!(_BYTE)v35) {
    goto LABEL_56;
  }
  if (v35)
  {
    int v36 = *((_DWORD *)a2 + 8);
    *((_DWORD *)this + 52) |= 1u;
    *((_DWORD *)this + 8) = v36;
    int v35 = *((_DWORD *)a2 + 52);
    if ((v35 & 8) == 0)
    {
LABEL_54:
      if ((v35 & 0x10) == 0) {
        goto LABEL_55;
      }
      goto LABEL_60;
    }
  }
  else if ((v35 & 8) == 0)
  {
    goto LABEL_54;
  }
  char v37 = *((unsigned char *)a2 + 36);
  *((_DWORD *)this + 52) |= 8u;
  *((unsigned char *)this + 36) = v37;
  int v35 = *((_DWORD *)a2 + 52);
  if ((v35 & 0x10) != 0)
  {
LABEL_60:
    int v38 = *((_DWORD *)a2 + 50);
    *((_DWORD *)this + 52) |= 0x10u;
    *((_DWORD *)this + 50) = v38;
    int v35 = *((_DWORD *)a2 + 52);
    if ((v35 & 0x20) != 0) {
      goto LABEL_61;
    }
LABEL_56:
    if ((v35 & 0x200) == 0) {
      return;
    }
    goto LABEL_64;
  }
LABEL_55:
  if ((v35 & 0x20) == 0) {
    goto LABEL_56;
  }
LABEL_61:
  uint64_t v39 = (const std::string *)*((void *)a2 + 8);
  *((_DWORD *)this + 52) |= 0x20u;
  int v40 = (std::string *)*((void *)this + 8);
  if (v40 == (std::string *)&wireless_diagnostics::google::protobuf::internal::kEmptyString) {
    operator new();
  }
  int v29 = std::string::operator=(v40, v39);
  if ((*((_DWORD *)a2 + 52) & 0x200) != 0)
  {
LABEL_64:
    *((_DWORD *)this + 52) |= 0x200u;
    uint64_t v41 = (awd::profile::TaskingCriteria *)*((void *)this + 18);
    if (!v41) {
      operator new();
    }
    uint64_t v42 = (const awd::profile::TaskingCriteria *)*((void *)a2 + 18);
    if (!v42)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)v29);
      uint64_t v42 = *(const awd::profile::TaskingCriteria **)(awd::profile::DeviceConfiguration::default_instance_ + 144);
    }
    awd::profile::TaskingCriteria::MergeFrom(v41, v42);
  }
}

void sub_10013B37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::DeviceConfiguration::~DeviceConfiguration(awd::profile::DeviceConfiguration *this)
{
  *(void *)this = off_1001BF368;
  awd::profile::DeviceConfiguration::SharedDtor(this);
  sub_1000FB750((uint64_t *)this + 22);
  sub_1000FB750((uint64_t *)this + 19);
  sub_1000FB750((uint64_t *)this + 15);
  sub_1000FB750((uint64_t *)this + 12);
  sub_1000FB750((uint64_t *)this + 9);
  sub_1000FB750((uint64_t *)this + 5);
  sub_1000FB750((uint64_t *)this + 1);

  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::DeviceConfiguration::~DeviceConfiguration(this);

  operator delete();
}

void awd::profile::DeviceConfiguration::SharedDtor(awd::profile::DeviceConfiguration *this)
{
  uint64_t v2 = *((void *)this + 8);
  if ((_UNKNOWN *)v2 != &wireless_diagnostics::google::protobuf::internal::kEmptyString && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    operator delete();
  }
  awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this);
  if ((awd::profile::DeviceConfiguration *)awd::profile::DeviceConfiguration::default_instance_ != this)
  {
    uint64_t v4 = *((void *)this + 18);
    if (v4)
    {
      int v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

void awd::profile::DeviceConfiguration::New(awd::profile::DeviceConfiguration *this)
{
}

uint64_t awd::profile::DeviceConfiguration::Clear(awd::profile::DeviceConfiguration *this)
{
  char v2 = *((unsigned char *)this + 208);
  if (v2)
  {
    *((_DWORD *)this + 8) = 0;
    *((unsigned char *)this + 36) = 0;
    *((_DWORD *)this + 50) = 0;
    if ((v2 & 0x20) != 0)
    {
      uint64_t v3 = *((void *)this + 8);
      if ((_UNKNOWN *)v3 != &wireless_diagnostics::google::protobuf::internal::kEmptyString)
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
  }
  if ((*((unsigned char *)this + 209) & 2) != 0)
  {
    uint64_t v4 = *((void *)this + 18);
    if (v4)
    {
      *(_DWORD *)(v4 + 16) = 0;
      *(_DWORD *)(v4 + 28) = 0;
    }
  }
  sub_1000FB6E0((uint64_t)this + 8);
  sub_1000FB6E0((uint64_t)this + 40);
  sub_1000FB6E0((uint64_t)this + 72);
  sub_1000FB6E0((uint64_t)this + 96);
  sub_1000FB6E0((uint64_t)this + 120);
  sub_1000FB6E0((uint64_t)this + 152);
  uint64_t result = sub_1000FB6E0((uint64_t)this + 176);
  *((_DWORD *)this + 52) = 0;
  return result;
}

uint64_t awd::profile::DeviceConfiguration::MergePartialFromCodedStream(awd::profile::DeviceConfiguration *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  v122 = (awd::profile::DeviceConfiguration *)((char *)this + 8);
  int v5 = (awd::profile::DeviceConfiguration *)((char *)this + 40);
  int v6 = (awd::profile::DeviceConfiguration *)((char *)this + 72);
  uint64_t v7 = (awd::profile::DeviceConfiguration *)((char *)this + 96);
  uint64_t v8 = (awd::profile::DeviceConfiguration *)((char *)this + 120);
  uint64_t v9 = (awd::profile::DeviceConfiguration *)((char *)this + 152);
  int v10 = (awd::profile::DeviceConfiguration *)((char *)this + 176);
  while (1)
  {
LABEL_2:
    int v11 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v11 < *((void *)a2 + 2) && (*v11 & 0x80000000) == 0)
    {
      unint64_t TagFallback = *v11;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v11 + 1;
      if (!TagFallback) {
        return 1;
      }
      goto LABEL_7;
    }
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
    *((_DWORD *)a2 + 8) = TagFallback;
    if (!TagFallback) {
      return 1;
    }
LABEL_7:
    switch(TagFallback >> 3)
    {
      case 1u:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        unsigned int v123 = 0;
        uint64_t v14 = (char *)*((void *)a2 + 1);
        unint64_t v15 = *((void *)a2 + 2);
        if ((unint64_t)v14 >= v15 || *v14 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123);
          if (!result) {
            return result;
          }
          unsigned int v16 = v123;
          uint64_t v17 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v15 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v16 = *v14;
          uint64_t v17 = v14 + 1;
          *((void *)a2 + 1) = v17;
        }
        *((_DWORD *)this + 8) = v16;
        *((_DWORD *)this + 52) |= 1u;
        if ((unint64_t)v17 >= v15 || *v17 != 18) {
          continue;
        }
        goto LABEL_41;
      case 2u:
        int v13 = TagFallback & 7;
        if (v13 != 2) {
          goto LABEL_34;
        }
LABEL_42:
        int v24 = *((_DWORD *)this + 5);
        uint64_t v25 = *((int *)this + 4);
        if ((int)v25 >= v24)
        {
          if (v24 == *((_DWORD *)this + 6))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v122, v24 + 1);
            int v24 = *((_DWORD *)this + 5);
          }
          *((_DWORD *)this + 5) = v24 + 1;
          operator new();
        }
        uint64_t v26 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v25 + 1;
        uint64_t v27 = *(awd::profile::ComponentConfiguration **)(v26 + 8 * v25);
        unsigned int v123 = 0;
        uint64_t v28 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v28 >= *((void *)a2 + 2) || *v28 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
        }
          }
        else
        {
          unsigned int v123 = *v28;
          *((void *)a2 + 1) = v28 + 1;
        }
        int v29 = *((_DWORD *)a2 + 14);
        int v30 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v29 + 1;
        if (v29 >= v30) {
          return 0;
        }
        int v31 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
        if (!awd::profile::ComponentConfiguration::MergePartialFromCodedStream(v27, a2, v32)
          || !*((unsigned char *)a2 + 36))
        {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v31);
        int v33 = *((_DWORD *)a2 + 14);
        BOOL v34 = __OFSUB__(v33, 1);
        int v35 = v33 - 1;
        if (v35 < 0 == v34) {
          *((_DWORD *)a2 + 14) = v35;
        }
        uint64_t v17 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v17 >= *((void *)a2 + 2)) {
          continue;
        }
        int v36 = *v17;
        if (v36 == 18)
        {
LABEL_41:
          *((void *)a2 + 1) = v17 + 1;
          goto LABEL_42;
        }
        if (v36 != 26) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v17 + 1;
LABEL_60:
          int v37 = *((_DWORD *)this + 13);
          uint64_t v38 = *((int *)this + 12);
          if ((int)v38 >= v37)
          {
            if (v37 == *((_DWORD *)this + 14))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v5, v37 + 1);
              int v37 = *((_DWORD *)this + 13);
            }
            *((_DWORD *)this + 13) = v37 + 1;
            operator new();
          }
          uint64_t v39 = *((void *)this + 5);
          *((_DWORD *)this + 12) = v38 + 1;
          int v40 = *(awd::profile::TimerSpec **)(v39 + 8 * v38);
          unsigned int v123 = 0;
          uint64_t v41 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v41 >= *((void *)a2 + 2) || *v41 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
          }
            }
          else
          {
            unsigned int v123 = *v41;
            *((void *)a2 + 1) = v41 + 1;
          }
          int v42 = *((_DWORD *)a2 + 14);
          int v43 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v42 + 1;
          if (v42 >= v43) {
            return 0;
          }
          int v44 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
          if (!awd::profile::TimerSpec::MergePartialFromCodedStream(v40, a2, v45) || !*((unsigned char *)a2 + 36)) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v44);
          int v46 = *((_DWORD *)a2 + 14);
          BOOL v34 = __OFSUB__(v46, 1);
          int v47 = v46 - 1;
          if (v47 < 0 == v34) {
            *((_DWORD *)a2 + 14) = v47;
          }
          uint64_t v17 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v19 = *((void *)a2 + 2);
          if ((unint64_t)v17 >= v19) {
            goto LABEL_2;
          }
          int v48 = *v17;
        }
        while (v48 == 26);
        if (v48 != 32) {
          continue;
        }
        uint64_t v18 = v17 + 1;
        *((void *)a2 + 1) = v18;
LABEL_78:
        unsigned int v123 = 0;
        if ((unint64_t)v18 >= v19 || *v18 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123);
          if (!result) {
            return result;
          }
          unsigned int v49 = v123;
          int v50 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v19 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v49 = *v18;
          int v50 = v18 + 1;
          *((void *)a2 + 1) = v50;
        }
        *((unsigned char *)this + 36) = v49 != 0;
        int v20 = *((_DWORD *)this + 52) | 8;
        *((_DWORD *)this + 52) = v20;
        if ((unint64_t)v50 >= v19 || *v50 != 42) {
          continue;
        }
        *((void *)a2 + 1) = v50 + 1;
LABEL_86:
        *((_DWORD *)this + 52) = v20 | 0x20;
        if (*((_UNKNOWN **)this + 8) == &wireless_diagnostics::google::protobuf::internal::kEmptyString) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        int v51 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v51 >= *((void *)a2 + 2) || *v51 != 50) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v51 + 1;
LABEL_92:
          int v52 = *((_DWORD *)this + 21);
          uint64_t v53 = *((int *)this + 20);
          if ((int)v53 >= v52)
          {
            if (v52 == *((_DWORD *)this + 22))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v6, v52 + 1);
              int v52 = *((_DWORD *)this + 21);
            }
            *((_DWORD *)this + 21) = v52 + 1;
            operator new();
          }
          uint64_t v54 = *((void *)this + 9);
          *((_DWORD *)this + 20) = v53 + 1;
          v55 = *(awd::profile::MetricFileSpec **)(v54 + 8 * v53);
          unsigned int v123 = 0;
          v56 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v56 >= *((void *)a2 + 2) || *v56 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
          }
            }
          else
          {
            unsigned int v123 = *v56;
            *((void *)a2 + 1) = v56 + 1;
          }
          int v57 = *((_DWORD *)a2 + 14);
          int v58 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v57 + 1;
          if (v57 >= v58) {
            return 0;
          }
          int v59 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
          if (!awd::profile::MetricFileSpec::MergePartialFromCodedStream(v55, a2, v60)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v59);
          int v61 = *((_DWORD *)a2 + 14);
          BOOL v34 = __OFSUB__(v61, 1);
          int v62 = v61 - 1;
          if (v62 < 0 == v34) {
            *((_DWORD *)a2 + 14) = v62;
          }
          int v51 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v51 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v63 = *v51;
        }
        while (v63 == 50);
        if (v63 != 58) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v51 + 1;
LABEL_110:
          int v64 = *((_DWORD *)this + 27);
          uint64_t v65 = *((int *)this + 26);
          if ((int)v65 >= v64)
          {
            if (v64 == *((_DWORD *)this + 28))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7, v64 + 1);
              int v64 = *((_DWORD *)this + 27);
            }
            *((_DWORD *)this + 27) = v64 + 1;
            operator new();
          }
          uint64_t v66 = *((void *)this + 12);
          *((_DWORD *)this + 26) = v65 + 1;
          unsigned int v67 = *(awd::profile::TriggerSource **)(v66 + 8 * v65);
          unsigned int v123 = 0;
          v68 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v68 >= *((void *)a2 + 2) || *v68 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
          }
            }
          else
          {
            unsigned int v123 = *v68;
            *((void *)a2 + 1) = v68 + 1;
          }
          int v69 = *((_DWORD *)a2 + 14);
          int v70 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v69 + 1;
          if (v69 >= v70) {
            return 0;
          }
          int v71 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
          if (!awd::profile::TriggerSource::MergePartialFromCodedStream(v67, a2, v72)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v71);
          int v73 = *((_DWORD *)a2 + 14);
          BOOL v34 = __OFSUB__(v73, 1);
          int v74 = v73 - 1;
          if (v74 < 0 == v34) {
            *((_DWORD *)a2 + 14) = v74;
          }
          int v51 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v51 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v75 = *v51;
        }
        while (v75 == 58);
        if (v75 != 66) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v51 + 1;
LABEL_128:
          int v76 = *((_DWORD *)this + 33);
          uint64_t v77 = *((int *)this + 32);
          if ((int)v77 >= v76)
          {
            if (v76 == *((_DWORD *)this + 34))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v8, v76 + 1);
              int v76 = *((_DWORD *)this + 33);
            }
            *((_DWORD *)this + 33) = v76 + 1;
            operator new();
          }
          uint64_t v78 = *((void *)this + 15);
          *((_DWORD *)this + 32) = v77 + 1;
          v79 = *(awd::profile::TriggerProcessingRule **)(v78 + 8 * v77);
          unsigned int v123 = 0;
          v80 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v80 >= *((void *)a2 + 2) || *v80 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
          }
            }
          else
          {
            unsigned int v123 = *v80;
            *((void *)a2 + 1) = v80 + 1;
          }
          int v81 = *((_DWORD *)a2 + 14);
          int v82 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v81 + 1;
          if (v81 >= v82) {
            return 0;
          }
          int v83 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
          if (!awd::profile::TriggerProcessingRule::MergePartialFromCodedStream(v79, a2, v84)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v83);
          int v85 = *((_DWORD *)a2 + 14);
          BOOL v34 = __OFSUB__(v85, 1);
          int v86 = v85 - 1;
          if (v86 < 0 == v34) {
            *((_DWORD *)a2 + 14) = v86;
          }
          int v51 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v51 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v87 = *v51;
        }
        while (v87 == 66);
        if (v87 != 74) {
          continue;
        }
        *((void *)a2 + 1) = v51 + 1;
LABEL_146:
        *((_DWORD *)this + 52) |= 0x200u;
        v88 = (awd::profile::TaskingCriteria *)*((void *)this + 18);
        if (!v88) {
          operator new();
        }
        unsigned int v123 = 0;
        v89 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v89 >= *((void *)a2 + 2) || *v89 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
        }
          }
        else
        {
          unsigned int v123 = *v89;
          *((void *)a2 + 1) = v89 + 1;
        }
        int v90 = *((_DWORD *)a2 + 14);
        int v91 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v90 + 1;
        if (v90 >= v91) {
          return 0;
        }
        int v92 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
        if (!awd::profile::TaskingCriteria::MergePartialFromCodedStream(v88, a2, v93)
          || !*((unsigned char *)a2 + 36))
        {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v92);
        int v94 = *((_DWORD *)a2 + 14);
        BOOL v34 = __OFSUB__(v94, 1);
        int v95 = v94 - 1;
        if (v95 < 0 == v34) {
          *((_DWORD *)a2 + 14) = v95;
        }
        v96 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        if ((unint64_t)v96 < v21 && *v96 == 80)
        {
          uint64_t v22 = v96 + 1;
          *((void *)a2 + 1) = v22;
LABEL_160:
          unsigned int v123 = 0;
          if ((unint64_t)v22 >= v21 || *v22 < 0)
          {
            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123);
            if (!result) {
              return result;
            }
            unsigned int v97 = v123;
          }
          else
          {
            unsigned int v97 = *v22;
            *((void *)a2 + 1) = v22 + 1;
          }
          if (v97 <= 3)
          {
            *((_DWORD *)this + 52) |= 0x10u;
            *((_DWORD *)this + 50) = v97;
          }
          v98 = (unsigned __int8 *)*((void *)a2 + 1);
          if ((unint64_t)v98 < *((void *)a2 + 2) && *v98 == 90)
          {
            do
            {
              *((void *)a2 + 1) = v98 + 1;
LABEL_170:
              int v99 = *((_DWORD *)this + 41);
              uint64_t v100 = *((int *)this + 40);
              if ((int)v100 >= v99)
              {
                if (v99 == *((_DWORD *)this + 42))
                {
                  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v9, v99 + 1);
                  int v99 = *((_DWORD *)this + 41);
                }
                *((_DWORD *)this + 41) = v99 + 1;
                operator new();
              }
              uint64_t v101 = *((void *)this + 19);
              *((_DWORD *)this + 40) = v100 + 1;
              v102 = *(awd::profile::AggregationSpec **)(v101 + 8 * v100);
              unsigned int v123 = 0;
              v103 = (char *)*((void *)a2 + 1);
              if ((unint64_t)v103 >= *((void *)a2 + 2) || *v103 < 0)
              {
                if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
              }
                }
              else
              {
                unsigned int v123 = *v103;
                *((void *)a2 + 1) = v103 + 1;
              }
              int v104 = *((_DWORD *)a2 + 14);
              int v105 = *((_DWORD *)a2 + 15);
              *((_DWORD *)a2 + 14) = v104 + 1;
              if (v104 >= v105) {
                return 0;
              }
              int v106 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
              if (!awd::profile::AggregationSpec::MergePartialFromCodedStream(v102, a2, v107)
                || !*((unsigned char *)a2 + 36))
              {
                return 0;
              }
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v106);
              int v108 = *((_DWORD *)a2 + 14);
              BOOL v34 = __OFSUB__(v108, 1);
              int v109 = v108 - 1;
              if (v109 < 0 == v34) {
                *((_DWORD *)a2 + 14) = v109;
              }
              v98 = (unsigned __int8 *)*((void *)a2 + 1);
              unint64_t v110 = *((void *)a2 + 2);
            }
            while ((unint64_t)v98 < v110 && *v98 == 90);
            if ((int)v110 - (int)v98 >= 2 && *v98 == 130 && v98[1] == 1)
            {
              do
              {
                *((void *)a2 + 1) = v98 + 2;
LABEL_190:
                int v111 = *((_DWORD *)this + 47);
                uint64_t v112 = *((int *)this + 46);
                if ((int)v112 >= v111)
                {
                  if (v111 == *((_DWORD *)this + 48))
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v10, v111 + 1);
                    int v111 = *((_DWORD *)this + 47);
                  }
                  *((_DWORD *)this + 47) = v111 + 1;
                  sub_10013CBD0();
                }
                uint64_t v113 = *((void *)this + 22);
                *((_DWORD *)this + 46) = v112 + 1;
                v114 = *(awd::profile::DeviceConfiguration **)(v113 + 8 * v112);
                unsigned int v123 = 0;
                v115 = (char *)*((void *)a2 + 1);
                if ((unint64_t)v115 >= *((void *)a2 + 2) || *v115 < 0)
                {
                  if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v123))return 0; {
                }
                  }
                else
                {
                  unsigned int v123 = *v115;
                  *((void *)a2 + 1) = v115 + 1;
                }
                int v116 = *((_DWORD *)a2 + 14);
                int v117 = *((_DWORD *)a2 + 15);
                *((_DWORD *)a2 + 14) = v116 + 1;
                if (v116 >= v117) {
                  return 0;
                }
                int v118 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2, v123);
                if (!awd::profile::DeviceConfiguration::MergePartialFromCodedStream(v114, a2)
                  || !*((unsigned char *)a2 + 36))
                {
                  return 0;
                }
                wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2, v118);
                int v119 = *((_DWORD *)a2 + 14);
                BOOL v34 = __OFSUB__(v119, 1);
                int v120 = v119 - 1;
                if (v120 < 0 == v34) {
                  *((_DWORD *)a2 + 14) = v120;
                }
                v98 = (unsigned __int8 *)*((void *)a2 + 1);
                v121 = (unsigned __int8 *)*((void *)a2 + 2);
              }
              while ((int)v121 - (int)v98 > 1 && *v98 == 130 && v98[1] == 1);
              if (v98 == v121 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
              {
                *((_DWORD *)a2 + 8) = 0;
                uint64_t result = 1;
                *((unsigned char *)a2 + 36) = 1;
                return result;
              }
            }
          }
        }
        break;
      case 3u:
        int v13 = TagFallback & 7;
        if (v13 == 2) {
          goto LABEL_60;
        }
        goto LABEL_34;
      case 4u:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        uint64_t v18 = (char *)*((void *)a2 + 1);
        unint64_t v19 = *((void *)a2 + 2);
        goto LABEL_78;
      case 5u:
        int v13 = TagFallback & 7;
        if (v13 != 2) {
          goto LABEL_34;
        }
        int v20 = *((_DWORD *)this + 52);
        goto LABEL_86;
      case 6u:
        int v13 = TagFallback & 7;
        if (v13 == 2) {
          goto LABEL_92;
        }
        goto LABEL_34;
      case 7u:
        int v13 = TagFallback & 7;
        if (v13 == 2) {
          goto LABEL_110;
        }
        goto LABEL_34;
      case 8u:
        int v13 = TagFallback & 7;
        if (v13 == 2) {
          goto LABEL_128;
        }
        goto LABEL_34;
      case 9u:
        int v13 = TagFallback & 7;
        if (v13 == 2) {
          goto LABEL_146;
        }
        goto LABEL_34;
      case 0xAu:
        int v13 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        uint64_t v22 = (char *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_160;
      case 0xBu:
        int v13 = TagFallback & 7;
        if (v13 == 2) {
          goto LABEL_170;
        }
        goto LABEL_34;
      case 0x10u:
        int v13 = TagFallback & 7;
        if (v13 != 2) {
          goto LABEL_34;
        }
        goto LABEL_190;
      default:
        int v13 = TagFallback & 7;
LABEL_34:
        if (v13 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) == 0)return 0; {
        continue;
        }
    }
  }
}

uint64_t awd::profile::DeviceConfiguration::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  if (*(unsigned char *)(this + 208)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_DWORD *)(this + 32), (int)a2, a4);
  }
  if (*(int *)(v5 + 16) >= 1)
  {
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  if (*(int *)(v5 + 48) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(void *)(*(void *)(v5 + 40) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 48));
  }
  int v8 = *(_DWORD *)(v5 + 208);
  if ((v8 & 8) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned __int8 *)(v5 + 36), (BOOL)a2, a4);
    int v8 = *(_DWORD *)(v5 + 208);
  }
  if ((v8 & 0x20) != 0) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  if (*(int *)(v5 + 80) >= 1)
  {
    uint64_t v9 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, *(void *)(*(void *)(v5 + 72) + 8 * v9++), a2, a4);
    while (v9 < *(int *)(v5 + 80));
  }
  if (*(int *)(v5 + 104) >= 1)
  {
    uint64_t v10 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)7, *(void *)(*(void *)(v5 + 96) + 8 * v10++), a2, a4);
    while (v10 < *(int *)(v5 + 104));
  }
  if (*(int *)(v5 + 128) >= 1)
  {
    uint64_t v11 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)8, *(void *)(*(void *)(v5 + 120) + 8 * v11++), a2, a4);
    while (v11 < *(int *)(v5 + 128));
  }
  int v12 = *(_DWORD *)(v5 + 208);
  if ((v12 & 0x200) != 0)
  {
    uint64_t v13 = *(void *)(v5 + 144);
    if (!v13)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
      uint64_t v13 = *(void *)(awd::profile::DeviceConfiguration::default_instance_ + 144);
    }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)9, v13, a2, a4);
    int v12 = *(_DWORD *)(v5 + 208);
  }
  if ((v12 & 0x10) != 0) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xA, *(_DWORD *)(v5 + 200), (int)a2, a4);
  }
  if (*(int *)(v5 + 160) >= 1)
  {
    uint64_t v14 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xB, *(void *)(*(void *)(v5 + 152) + 8 * v14++), a2, a4);
    while (v14 < *(int *)(v5 + 160));
  }
  if (*(int *)(v5 + 184) >= 1)
  {
    uint64_t v15 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, *(void *)(*(void *)(v5 + 176) + 8 * v15++), a2, a4);
    while (v15 < *(int *)(v5 + 184));
  }
  return this;
}

uint64_t awd::profile::DeviceConfiguration::ByteSize(awd::profile::DeviceConfiguration *this, unint64_t a2)
{
  int v3 = *((_DWORD *)this + 52);
  if (!(_BYTE)v3)
  {
    int v5 = 0;
    if ((v3 & 0x200) == 0) {
      goto LABEL_40;
    }
    goto LABEL_34;
  }
  if (v3)
  {
    uint64_t v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 8);
    if ((v6 & 0x80000000) != 0)
    {
      int v7 = 10;
    }
    else if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6, a2);
      int v3 = *((_DWORD *)this + 52);
    }
    else
    {
      int v7 = 1;
    }
    int v4 = v7 + 1;
  }
  else
  {
    int v4 = 0;
  }
  if ((v3 & 8) != 0) {
    int v5 = v4 + 2;
  }
  else {
    int v5 = v4;
  }
  if ((v3 & 0x10) != 0)
  {
    int v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 50);
    if ((v8 & 0x80000000) != 0)
    {
      int v9 = 10;
    }
    else if (v8 >= 0x80)
    {
      int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8, a2);
      int v3 = *((_DWORD *)this + 52);
    }
    else
    {
      int v9 = 1;
    }
    v5 += v9 + 1;
    if ((v3 & 0x20) == 0)
    {
LABEL_17:
      if ((v3 & 0x200) == 0) {
        goto LABEL_40;
      }
      goto LABEL_34;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v10 = *((void *)this + 8);
  int v11 = *(unsigned __int8 *)(v10 + 23);
  char v12 = v11;
  uint64_t v13 = *(void *)(v10 + 8);
  if ((v11 & 0x80u) == 0) {
    unint64_t v14 = *(unsigned __int8 *)(v10 + 23);
  }
  else {
    unint64_t v14 = v13;
  }
  if (v14 >= 0x80)
  {
    int v15 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v14, a2);
    int v11 = *(unsigned __int8 *)(v10 + 23);
    uint64_t v13 = *(void *)(v10 + 8);
    int v3 = *((_DWORD *)this + 52);
    char v12 = *(unsigned char *)(v10 + 23);
  }
  else
  {
    int v15 = 1;
  }
  if (v12 < 0) {
    int v11 = v13;
  }
  v5 += v15 + v11 + 1;
  if ((v3 & 0x200) != 0)
  {
LABEL_34:
    unsigned int v16 = (awd::profile::TaskingCriteria *)*((void *)this + 18);
    if (!v16)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0);
      unsigned int v16 = *(awd::profile::TaskingCriteria **)(awd::profile::DeviceConfiguration::default_instance_ + 144);
    }
    uint64_t v17 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TaskingCriteria::ByteSize(v16, a2);
    int v18 = (int)v17;
    if (v17 >= 0x80) {
      int v19 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v17, a2);
    }
    else {
      int v19 = 1;
    }
    v5 += v18 + v19 + 1;
  }
LABEL_40:
  int v20 = *((_DWORD *)this + 4);
  int v21 = v20 + v5;
  if (v20 >= 1)
  {
    uint64_t v22 = 0;
    do
    {
      uint64_t v23 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ComponentConfiguration::ByteSize(*(awd::profile::ComponentConfiguration **)(*((void *)this + 1) + 8 * v22), a2);
      int v24 = (int)v23;
      if (v23 >= 0x80) {
        int v25 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v23, a2);
      }
      else {
        int v25 = 1;
      }
      v21 += v24 + v25;
      ++v22;
    }
    while (v22 < *((int *)this + 4));
  }
  int v26 = *((_DWORD *)this + 12);
  int v27 = v26 + v21;
  if (v26 >= 1)
  {
    uint64_t v28 = 0;
    do
    {
      int v29 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TimerSpec::ByteSize(*(wireless_diagnostics::google::protobuf::io::CodedOutputStream ***)(*((void *)this + 5) + 8 * v28), a2);
      int v30 = (int)v29;
      if (v29 >= 0x80) {
        int v31 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v29, a2);
      }
      else {
        int v31 = 1;
      }
      v27 += v30 + v31;
      ++v28;
    }
    while (v28 < *((int *)this + 12));
  }
  int v32 = *((_DWORD *)this + 20);
  int v33 = v32 + v27;
  if (v32 >= 1)
  {
    uint64_t v34 = 0;
    do
    {
      int v35 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::MetricFileSpec::ByteSize(*(awd::profile::MetricFileSpec **)(*((void *)this + 9) + 8 * v34), a2);
      int v36 = (int)v35;
      if (v35 >= 0x80) {
        int v37 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v35, a2);
      }
      else {
        int v37 = 1;
      }
      v33 += v36 + v37;
      ++v34;
    }
    while (v34 < *((int *)this + 20));
  }
  int v38 = *((_DWORD *)this + 26);
  int v39 = v38 + v33;
  if (v38 >= 1)
  {
    uint64_t v40 = 0;
    do
    {
      uint64_t v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TriggerSource::ByteSize(*(awd::profile::TriggerSource **)(*((void *)this + 12) + 8 * v40), a2);
      int v42 = (int)v41;
      if (v41 >= 0x80) {
        int v43 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v41, a2);
      }
      else {
        int v43 = 1;
      }
      v39 += v42 + v43;
      ++v40;
    }
    while (v40 < *((int *)this + 26));
  }
  int v44 = *((_DWORD *)this + 32);
  int v45 = v44 + v39;
  if (v44 >= 1)
  {
    uint64_t v46 = 0;
    do
    {
      int v47 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TriggerProcessingRule::ByteSize(*(awd::profile::TriggerProcessingRule **)(*((void *)this + 15) + 8 * v46), a2);
      int v48 = (int)v47;
      if (v47 >= 0x80) {
        int v49 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v47, a2);
      }
      else {
        int v49 = 1;
      }
      v45 += v48 + v49;
      ++v46;
    }
    while (v46 < *((int *)this + 32));
  }
  int v50 = *((_DWORD *)this + 40);
  int v51 = v50 + v45;
  if (v50 >= 1)
  {
    uint64_t v52 = 0;
    do
    {
      uint64_t v53 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::AggregationSpec::ByteSize(*(awd::profile::AggregationSpec **)(*((void *)this + 19) + 8 * v52), a2);
      int v54 = (int)v53;
      if (v53 >= 0x80) {
        int v55 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v53, a2);
      }
      else {
        int v55 = 1;
      }
      v51 += v54 + v55;
      ++v52;
    }
    while (v52 < *((int *)this + 40));
  }
  int v56 = *((_DWORD *)this + 46);
  uint64_t v57 = (v51 + 2 * v56);
  if (v56 >= 1)
  {
    uint64_t v58 = 0;
    do
    {
      int v59 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::DeviceConfiguration::ByteSize(*(awd::profile::DeviceConfiguration **)(*((void *)this + 22) + 8 * v58));
      int v61 = (int)v59;
      if (v59 >= 0x80) {
        int v62 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v59, v60);
      }
      else {
        int v62 = 1;
      }
      uint64_t v57 = (v61 + v57 + v62);
      ++v58;
    }
    while (v58 < *((int *)this + 46));
  }
  *((_DWORD *)this + 51) = v57;
  return v57;
}

uint64_t awd::profile::DeviceConfiguration::IsInitialized(awd::profile::DeviceConfiguration *this)
{
  return 1;
}

void *awd::profile::DeviceConfiguration::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_100018888(a1, "awd.profile.DeviceConfiguration");
}

uint64_t sub_10013CB38(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_10013CB40(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t sub_10013CB48(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_10013CB50(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t sub_10013CB58(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t sub_10013CB60(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_10013CB68(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_10013CB70(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_10013CB78(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_10013CB80(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_10013CB88(uint64_t a1)
{
  return *(unsigned int *)(a1 + 68);
}

uint64_t sub_10013CB90(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

uint64_t sub_10013CB98(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_10013CBA0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

uint64_t sub_10013CBA8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 76);
}

uint64_t sub_10013CBB0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_10013CBB8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_10013CBC0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_10013CBC8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 204);
}

void sub_10013CBD0()
{
}

uint64_t sub_10013CC70(int *a1)
{
  if (a1[3] >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete();
      ++v2;
    }
    while (v2 < a1[3]);
  }
  uint64_t result = *(void *)a1;
  if (*(void *)a1)
  {
    operator delete[]();
  }
  return result;
}

void sub_10013CCF0(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(a1, *(_DWORD *)(a2 + 8) + *((_DWORD *)a1 + 2));
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *(const awd::profile::Profile **)(*(void *)a2 + 8 * v4);
      int v6 = *((_DWORD *)a1 + 3);
      uint64_t v7 = *((int *)a1 + 2);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)a1 + 4))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(a1, v6 + 1);
          int v6 = *((_DWORD *)a1 + 3);
        }
        *((_DWORD *)a1 + 3) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      *((_DWORD *)a1 + 2) = v7 + 1;
      awd::profile::Profile::MergeFrom(*(awd::profile::Profile **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

void sub_10013CE24(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(a1, *(_DWORD *)(a2 + 8) + *((_DWORD *)a1 + 2));
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *(const awd::profile::Condition **)(*(void *)a2 + 8 * v4);
      int v6 = *((_DWORD *)a1 + 3);
      uint64_t v7 = *((int *)a1 + 2);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)a1 + 4))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(a1, v6 + 1);
          int v6 = *((_DWORD *)a1 + 3);
        }
        *((_DWORD *)a1 + 3) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      *((_DWORD *)a1 + 2) = v7 + 1;
      awd::profile::Condition::MergeFrom(*(awd::profile::Condition **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

void sub_10013CF48(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(a1, *(_DWORD *)(a2 + 8) + *((_DWORD *)a1 + 2));
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *(const awd::profile::MetricFileSpec **)(*(void *)a2 + 8 * v4);
      int v6 = *((_DWORD *)a1 + 3);
      uint64_t v7 = *((int *)a1 + 2);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)a1 + 4))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(a1, v6 + 1);
          int v6 = *((_DWORD *)a1 + 3);
        }
        *((_DWORD *)a1 + 3) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      *((_DWORD *)a1 + 2) = v7 + 1;
      awd::profile::MetricFileSpec::MergeFrom(*(awd::profile::MetricFileSpec **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

uint64_t sub_10013D064(uint64_t a1, uint64_t a2, const char *a3)
{
  sub_10013D620(a3, a2, &v7);
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v7);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  *(void *)a1 = &off_1001BF600;
  long long v5 = *(_OWORD *)a2;
  *(void *)(a1 + 32) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = v5;
  return a1;
}

void sub_10013D0E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::filesystem::filesystem_error::filesystem_error(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v6 = (void *)sub_10013D064(a1, a4, a2);
  void *v6 = off_1001BF5A8;
  v6[5] = 0;
  std::string v7 = v6 + 5;
  uint64_t v8 = (char *)operator new(0x50uLL);
  *(_DWORD *)uint64_t v8 = 0;
  int v9 = v8 + 8;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_1000173FC(v9, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)int v9 = *(_OWORD *)a3;
    *((void *)v8 + 3) = *(void *)(a3 + 16);
  }
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  int v11 = v8;
  atomic_fetch_add((atomic_uint *volatile)v8, 1u);
  int v11 = (char *)*v7;
  *std::string v7 = (uint64_t)v8;
  sub_10013DFB4((uint64_t *)&v11);
  return a1;
}

void sub_10013D1D0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  operator delete(v11);
  __cxa_begin_catch(a1);
  a10 = *v10;
  *uint64_t v10 = 0;
  sub_10013DFB4(&a10);
  __cxa_end_catch();
  JUMPOUT(0x10013D1B8);
}

void sub_10013D208(_Unwind_Exception *a1)
{
  sub_10013DFB4(v2);
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

void boost::filesystem::filesystem_error::~filesystem_error(boost::filesystem::filesystem_error *this)
{
  *(void *)this = off_1001BF5A8;
  sub_10013DFB4((uint64_t *)this + 5);

  std::runtime_error::~runtime_error((std::runtime_error *)this);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = off_1001BF5A8;
  sub_10013DFB4((uint64_t *)this + 5);
  std::runtime_error::~runtime_error((std::runtime_error *)this);

  operator delete(v2);
}

const char *boost::filesystem::filesystem_error::what(std::runtime_error *this)
{
  imp = this[2].__imp_.__imp_;
  if (imp)
  {
    if (imp[79] < 0)
    {
      if (*((void *)imp + 8)) {
        goto LABEL_28;
      }
    }
    else if (imp[79])
    {
      goto LABEL_28;
    }
    int v3 = (char *)std::runtime_error::what(this);
    sub_10013DEA0((std::string *)(this[2].__imp_.__imp_ + 56), v3);
    imp = this[2].__imp_.__imp_;
    if (imp[31] < 0)
    {
      if (!*((void *)imp + 2)) {
        goto LABEL_17;
      }
    }
    else if (!imp[31])
    {
      goto LABEL_17;
    }
    std::string::append((std::string *)(imp + 56), ": \"", 3uLL);
    uint64_t v4 = this[2].__imp_.__imp_;
    std::string v7 = (const std::string::value_type *)*((void *)v4 + 1);
    long long v5 = v4 + 8;
    int v6 = v7;
    int v8 = v5[23];
    if (v8 >= 0) {
      int v9 = v5;
    }
    else {
      int v9 = v6;
    }
    if (v8 >= 0) {
      std::string::size_type v10 = *((unsigned __int8 *)v5 + 23);
    }
    else {
      std::string::size_type v10 = *((void *)v5 + 1);
    }
    std::string::append((std::string *)v5 + 2, v9, v10);
    std::string::append((std::string *)(this[2].__imp_.__imp_ + 56), "\"", 1uLL);
    imp = this[2].__imp_.__imp_;
LABEL_17:
    if (imp[55] < 0)
    {
      if (!*((void *)imp + 5)) {
        goto LABEL_28;
      }
    }
    else if (!imp[55])
    {
LABEL_28:
      uint64_t result = imp + 56;
      if (imp[79] < 0) {
        return *(const char **)result;
      }
      return result;
    }
    std::string::append((std::string *)(imp + 56), ", \"", 3uLL);
    int v11 = this[2].__imp_.__imp_;
    unint64_t v14 = (const std::string::value_type *)*((void *)v11 + 4);
    char v12 = v11 + 32;
    uint64_t v13 = v14;
    int v15 = v12[23];
    if (v15 >= 0) {
      unsigned int v16 = v12;
    }
    else {
      unsigned int v16 = v13;
    }
    if (v15 >= 0) {
      std::string::size_type v17 = *((unsigned __int8 *)v12 + 23);
    }
    else {
      std::string::size_type v17 = *((void *)v12 + 1);
    }
    std::string::append((std::string *)v12 + 1, v16, v17);
    std::string::append((std::string *)(this[2].__imp_.__imp_ + 56), "\"", 1uLL);
    imp = this[2].__imp_.__imp_;
    goto LABEL_28;
  }

  return std::runtime_error::what(this);
}

uint64_t sub_10013D47C(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_10013D4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    v13[0] = 0;
    if ((unint64_t)qword_1001D7BE0 >> 1 == 0x595588BD12BF6FE8) {
      int v9 = a1 != 0;
    }
    else {
      int v9 = ((uint64_t (*)(uint64_t (***)(), uint64_t))boost::system::detail::system_cat_holder<void>::instance[6])(&boost::system::detail::system_cat_holder<void>::instance, a1);
    }
    uint64_t v10 = 2;
    LODWORD(v13[0]) = a1;
    if (v9) {
      uint64_t v10 = 3;
    }
    v13[1] = &boost::system::detail::system_cat_holder<void>::instance;
    v13[2] = v10;
    boost::filesystem::filesystem_error::filesystem_error(exception, a4, a2, v13);
  }
  if ((unint64_t)qword_1001D7BE0 >> 1 == 0x595588BD12BF6FE8) {
    uint64_t result = a1 != 0;
  }
  else {
    uint64_t result = ((uint64_t (*)(uint64_t (***)(), uint64_t))boost::system::detail::system_cat_holder<void>::instance[6])(&boost::system::detail::system_cat_holder<void>::instance, a1);
  }
  uint64_t v7 = 2;
  if (result) {
    uint64_t v7 = 3;
  }
  *(_DWORD *)a3 = a1;
  *(_DWORD *)(a3 + 4) = 0;
  *(void *)(a3 + 8) = &boost::system::detail::system_cat_holder<void>::instance;
  *(void *)(a3 + 16) = v7;
  return result;
}

void sub_10013D60C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10013D620(const char *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  if (a1)
  {
    std::string::size_type v6 = strlen(a1);
    std::string::append(a3, a1, v6);
    std::string::append(a3, ": ", 2uLL);
  }
  sub_10013D730(a2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::append(a3, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_10013D6CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_10013D708(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  operator delete(v1);
}

std::string *sub_10013D730@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  sub_10013D884((unsigned int *)a1, a2);
  std::string::append(a2, " [", 2uLL);
  sub_10013D8D4((int *)a1, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (*(void *)(a1 + 16) >= 4uLL)
  {
    std::string::append(a2, " at ", 4uLL);
    unint64_t v6 = *(void *)(a1 + 16);
    if (v6 <= 3) {
      uint64_t v7 = off_1001BF628;
    }
    else {
      uint64_t v7 = (char **)(v6 & 0xFFFFFFFFFFFFFFFELL);
    }
    sub_10013DAA0((uint64_t)v7, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v8 = &__p;
    }
    else {
      int v8 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v9 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v9 = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(a2, (const std::string::value_type *)v8, v9);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return std::string::append(a2, "]", 1uLL);
}

void sub_10013D844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_10013D884@<X0>(unsigned int *a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = *((void *)a1 + 2);
  if (v2)
  {
    if (v2 == 1) {
      return std::error_code::message(a2, (const std::error_code *)a1);
    }
    uint64_t v4 = (uint64_t (***)())*((void *)a1 + 1);
  }
  else
  {
    uint64_t v4 = &boost::system::detail::system_cat_holder<void>::instance;
  }
  return (std::string *)((uint64_t (*)(uint64_t (***)(), void))(*v4)[4])(v4, *a1);
}

std::string *sub_10013D8D4@<X0>(int *a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v4 = *((void *)a1 + 2);
  if (v4)
  {
    if (v4 == 1)
    {
      sub_100018888(a2, "std:");
      long long v5 = (const char *)(*(uint64_t (**)(void))(**((void **)a1 + 1) + 16))(*((void *)a1 + 1));
      std::string::size_type v6 = strlen(v5);
      std::string::append(a2, v5, v6);
      sub_10013DDB4(__s, 0x20uLL, ":%d", v7, v8, v9, v10, v11, *a1);
      std::string::size_type v12 = strlen(__s);
      return std::string::append(a2, __s, v12);
    }
    unint64_t v14 = (uint64_t (***)())*((void *)a1 + 1);
  }
  else
  {
    unint64_t v14 = &boost::system::detail::system_cat_holder<void>::instance;
  }
  uint64_t v15 = (char *)((uint64_t (*)(uint64_t (***)()))**v14)(v14);
  sub_100018888(a2, v15);
  int v21 = *a1;
  if (*((void *)a1 + 2) == 1) {
    v21 += 1000 * (*((void *)a1 + 1) % 0x1FFFF7uLL);
  }
  sub_10013DDB4(__s, 0x20uLL, ":%d", v16, v17, v18, v19, v20, v21);
  std::string::size_type v22 = strlen(__s);
  return std::string::append(a2, __s, v22);
}

void sub_10013DA80(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10013DAA0(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(_DWORD *)(a1 + 16))
  {
    sub_100018888(a2, *(char **)a1);
    sprintf(__s, ":%ld", *(unsigned int *)(a1 + 16));
    std::string::size_type v4 = strlen(__s);
    std::string::append(a2, __s, v4);
    if (*(_DWORD *)(a1 + 20))
    {
      sprintf(__s, ":%ld", *(unsigned int *)(a1 + 20));
      std::string::size_type v5 = strlen(__s);
      std::string::append(a2, __s, v5);
    }
    std::string::append(a2, " in function '", 0xEuLL);
    std::string::size_type v6 = *(const char **)(a1 + 8);
    std::string::size_type v7 = strlen(v6);
    std::string::append(a2, v6, v7);
    std::string::push_back(a2, 39);
  }
  else
  {
    sub_100018888(a2, "(unknown source location)");
  }
}

void sub_10013DBF0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10013DC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)a3 != (*(unsigned int (**)(uint64_t))(*(void *)a1 + 8))(a1)) {
    return 0;
  }
  uint64_t v5 = *(void *)(a3 + 8);
  if (!v4)
  {
    if (!v5) {
      return 1;
    }
    uint64_t v9 = *(void *)(v5 + 8);
    return v9 == 0xB2AB117A257EDFD0;
  }
  if (!v5)
  {
    uint64_t v9 = *(void *)(v4 + 8);
    return v9 == 0xB2AB117A257EDFD0;
  }
  uint64_t v6 = *(void *)(v5 + 8);
  BOOL v7 = v5 == v4;
  if (v6) {
    return *(void *)(v4 + 8) == v6;
  }
  else {
    return v7;
  }
}

BOOL sub_10013DCC4(uint64_t a1, uint64_t a2, int a3)
{
  return sub_10013DCE4(a2, a3, a1);
}

BOOL sub_10013DCD8(uint64_t a1, int a2)
{
  return a2 != 0;
}

BOOL sub_10013DCE4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 == 1)
  {
    if (*(void *)(a3 + 8) == 0xB2AB117A257EDFD2) {
      return *(_DWORD *)a1 + 1000 * (*(void *)(a1 + 8) % 0x1FFFF7uLL) == a2;
    }
    return 0;
  }
  if (!v3) {
    return !a2 && *(void *)(a3 + 8) == 0xB2AB117A257EDFD1;
  }
  if (*(_DWORD *)a1 != a2) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(v6 + 8);
  BOOL v8 = v6 == a3;
  if (v7) {
    return *(void *)(a3 + 8) == v7;
  }
  else {
    return v8;
  }
}

uint64_t sub_10013DDB4(char *a1, size_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return vsnprintf(a1, a2, a3, &a9);
}

std::string *sub_10013DDE0(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = __dst->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      std::string::size_type v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

std::string *sub_10013DEA0(std::string *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_10013DDE0(a1, __s, v4);
}

const char *sub_10013DEE8()
{
  return "system";
}

uint64_t sub_10013DEF4(uint64_t a1, unsigned int a2)
{
  return a2;
}

void *sub_10013DF00@<X0>(int __errnum@<W1>, void *a2@<X8>)
{
  uint64_t v3 = strerror(__errnum);
  if (v3) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = "Unknown error";
  }

  return sub_100018888(a2, v4);
}

const char *sub_10013DF4C(int a1, int __errnum, char *a3, uint64_t a4)
{
  size_t v4 = a3;
  if (a4)
  {
    uint64_t v5 = a3;
    size_t v6 = a4 - 1;
    if (a4 != 1)
    {
      uint64_t v7 = strerror(__errnum);
      if (!v7) {
        return "Unknown error";
      }
      strncpy(v4, v7, v6);
      uint64_t v5 = &v4[v6];
    }
    char *v5 = 0;
  }
  return v4;
}

uint64_t *sub_10013DFB4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1 && atomic_fetch_add((atomic_uint *volatile)v2, 0xFFFFFFFF) == 1)
  {
    if (*(char *)(v2 + 79) < 0) {
      operator delete(*(void **)(v2 + 56));
    }
    if (*(char *)(v2 + 55) < 0) {
      operator delete(*(void **)(v2 + 32));
    }
    if (*(char *)(v2 + 31) < 0) {
      operator delete(*(void **)(v2 + 8));
    }
    operator delete((void *)v2);
  }
  return a1;
}

double sub_10013E028@<D0>(uint64_t a1@<X0>, void *a2@<X1>, double *a3@<X8>)
{
  if (*(_DWORD *)(a1 + 24)) {
    BOOL v5 = *(_DWORD *)(a1 + 28) == 0xFFFF;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int v6 = *(_DWORD *)(a1 + 32);
    int v7 = *(_DWORD *)(a1 + 36);
    if ((v6 & 0xFFFFFFFB) == 0 || v7 == 0xFFFF)
    {
      sub_10013F774((const char *)a1, (uint64_t)a2, (int *)&v10);
      *(void *)(a1 + 24) = v10;
      goto LABEL_14;
    }
    *(_DWORD *)(a1 + 24) = v6;
    *(_DWORD *)(a1 + 28) = v7;
  }
  if (a2)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
LABEL_14:
  double result = *(double *)(a1 + 24);
  *a3 = result;
  return result;
}

DIR *sub_10013E0AC@<X0>(DIR **a1@<X0>, void **a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    free(*a2);
    *a2 = 0;
  }
  double result = *a1;
  if (*a1 && (*a1 = 0, double result = (DIR *)closedir(result), result))
  {
    uint64_t v7 = *__error();
    return (DIR *)sub_10013E140(a3, v7, &boost::system::detail::system_cat_holder<void>::instance);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return result;
}

void *sub_10013E140(void *a1, uint64_t a2, void *a3)
{
  int v4 = a2;
  *a1 = 0;
  a1[1] = 0;
  if (a3[1] >> 1 == 0x595588BD12BF6FE8) {
    int v6 = a2 != 0;
  }
  else {
    int v6 = (*(uint64_t (**)(void *, uint64_t))(*a3 + 48))(a3, a2);
  }
  uint64_t v7 = 2;
  *(_DWORD *)a1 = v4;
  if (v6) {
    uint64_t v7 = 3;
  }
  a1[1] = a3;
  a1[2] = v7;
  return a1;
}

atomic_uint **sub_10013E1E0(dirent **a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a2 + 8);
  }
  if (v6)
  {
    if (a4)
    {
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      int v33 = 0;
      std::string::size_type v9 = operator new(0x40uLL, &std::nothrow);
      if (v9)
      {
        *(_DWORD *)std::string::size_type v9 = 0;
        v9[2] = 0;
        v9[3] = 0;
        v9[1] = 0;
        *((_DWORD *)v9 + 8) = 0;
        *(void *)((char *)v9 + 36) = 0xFFFFLL;
        *((_DWORD *)v9 + 11) = 0xFFFF;
        v9[6] = 0;
        v9[7] = 0;
        int v30 = (atomic_uint *)v9;
        atomic_fetch_add((atomic_uint *volatile)v9, 1u);
        uint64_t v10 = (atomic_uint *)v9;
        uint64_t v11 = v33;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v10 = 0;
      }
      int v30 = v11;
      int v33 = v10;
      sub_100030C9C(&v30);
      uint64_t v13 = v33;
      if (!v33)
      {
        if ((unint64_t)qword_1001D7BF8 >> 1 == 0x595588BD12BF6FE8
          || ((unsigned int (*)(uint64_t (***)(), uint64_t))boost::system::detail::generic_cat_holder<void>::instance[6])(&boost::system::detail::generic_cat_holder<void>::instance, 12))
        {
          uint64_t v27 = 3;
        }
        else
        {
          uint64_t v27 = 2;
        }
        *a4 = 12;
        a4[1] = &boost::system::detail::generic_cat_holder<void>::instance;
        a4[2] = v27;
        return sub_100030C9C(&v33);
      }
    }
    else
    {
      int v33 = 0;
      std::string::size_type v12 = operator new(0x40uLL);
      *(_DWORD *)std::string::size_type v12 = 0;
      v12[2] = 0;
      v12[3] = 0;
      v12[1] = 0;
      *((_DWORD *)v12 + 8) = 0;
      *(void *)((char *)v12 + 36) = 0xFFFFLL;
      *((_DWORD *)v12 + 11) = 0xFFFF;
      v12[6] = 0;
      v12[7] = 0;
      int v30 = (atomic_uint *)v12;
      atomic_fetch_add((atomic_uint *volatile)v12, 1u);
      int v30 = v33;
      int v33 = (atomic_uint *)v12;
      sub_100030C9C(&v30);
      uint64_t v13 = v33;
    }
    if (*(char *)(a2 + 23) >= 0) {
      unint64_t v14 = (const char *)a2;
    }
    else {
      unint64_t v14 = *(const char **)a2;
    }
    uint64_t v15 = opendir(v14);
    *((void *)v13 + 6) = v15;
    if (v15)
    {
      char v16 = 1;
      uint64_t v17 = 46;
    }
    else
    {
      uint64_t v18 = *__error();
      int v30 = 0;
      if ((unint64_t)qword_1001D7BE0 >> 1 == 0x595588BD12BF6FE8) {
        int v19 = v18 != 0;
      }
      else {
        int v19 = ((uint64_t (*)(uint64_t (***)(), uint64_t))boost::system::detail::system_cat_holder<void>::instance[6])(&boost::system::detail::system_cat_holder<void>::instance, v18);
      }
      uint64_t v20 = 2;
      LODWORD(v30) = v18;
      if (v19) {
        uint64_t v20 = 3;
      }
      unint64_t v31 = (unint64_t)&boost::system::detail::system_cat_holder<void>::instance;
      uint64_t v32 = v20;
      if (v20)
      {
        __str.__r_.__value_.__r.__words[0] = 13;
        __str.__r_.__value_.__l.__size_ = (std::string::size_type)&boost::system::detail::generic_cat_holder<void>::instance;
        char v24 = sub_10013ECCC((uint64_t *)&v30, (uint64_t)&__str);
        if ((a3 & 1) == 0 || (v24 & 1) == 0)
        {
          uint64_t v25 = v30;
          if (v32 == 1) {
            uint64_t v25 = v30 + 1000 * (v31 % 0x1FFFF7);
          }
          if (v25)
          {
            sub_10013D4B0(v25, a2, (uint64_t)a4, (uint64_t)"boost::filesystem::directory_iterator::construct");
          }
          else if (a4)
          {
            *a4 = 0;
            a4[1] = 0;
            a4[2] = 0;
          }
        }
        return sub_100030C9C(&v33);
      }
      uint64_t v17 = 0;
      char v16 = 0;
    }
    int v21 = v33;
    if (*((void *)v33 + 6))
    {
      std::string::size_type v22 = *a1;
      *a1 = (dirent *)v33;
      int v33 = (atomic_uint *)v22;
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = (unint64_t)v17;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = v16;
      if (*(char *)(a2 + 23) < 0) {
        sub_1000173FC(&__str, *(void **)a2, *(void *)(a2 + 8));
      }
      else {
        std::string __str = *(std::string *)a2;
      }
      sub_10013FB8C((uint64_t)&__str, &__p);
      std::string::operator=((std::string *)(v21 + 2), &__str);
      *(void *)&long long v23 = 0xFFFF00000000;
      *((void *)&v23 + 1) = 0xFFFF00000000;
      *((_OWORD *)v21 + 2) = v23;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        if (!v15) {
          return sub_100030C9C(&v33);
        }
        goto LABEL_32;
      }
      operator delete(__p.__r_.__value_.__l.__data_);
      if (v15) {
LABEL_32:
      }
        sub_10013E6D8(a1, (uint64_t)a4);
    }
    return sub_100030C9C(&v33);
  }

  return (atomic_uint **)sub_10013D4B0(2, a2, (uint64_t)a4, (uint64_t)"boost::filesystem::directory_iterator::construct");
}

void sub_10013E5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (v23)
    {
      if ((unint64_t)qword_1001D7BF8 >> 1 == 0x595588BD12BF6FE8
        || ((unsigned int (*)(uint64_t (***)(), uint64_t))boost::system::detail::generic_cat_holder<void>::instance[6])(&boost::system::detail::generic_cat_holder<void>::instance, 12))
      {
        uint64_t v28 = 3;
      }
      else
      {
        uint64_t v28 = 2;
      }
      void *v23 = 12;
      v23[1] = &boost::system::detail::generic_cat_holder<void>::instance;
      v23[2] = v28;
      a23 = *v24;
      *char v24 = 0;
      sub_100030C9C((atomic_uint **)&a23);
      __cxa_end_catch();
      JUMPOUT(0x10013E4D8);
    }
    __cxa_rethrow();
  }
  sub_100030C9C((atomic_uint **)(v25 - 72));
  _Unwind_Resume(a1);
}

void sub_10013E6C8()
{
}

void sub_10013E6D8(dirent **a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  memset(&__src, 0, sizeof(__src));
  int v29 = 0;
  uint64_t v28 = 0;
  int v4 = *a1;
  BOOL v5 = *(DIR **)&(*a1)->d_name[27];
  while (1)
  {
    uint64_t v27 = 0;
    *__error() = 0;
    uint64_t v6 = (dirent **)&v4->d_name[35];
    if (sysconf(91) < 0)
    {
      *__error() = 0;
      std::string::size_type v9 = readdir(v5);
      uint64_t v27 = v9;
      if (v9)
      {
LABEL_14:
        sub_10013DEA0(&__src, v9->d_name);
        memset(&__p, 0, sizeof(__p));
        uint64_t v28 = 0;
        int v29 = 0;
        goto LABEL_15;
      }
      uint64_t v8 = *__error();
      if (v8) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v7 = *v6;
      if (!*v6)
      {
        uint64_t v20 = sub_10013F6C0() + 25;
        uint64_t v15 = (dirent *)malloc(v20);
        const char *v6 = v15;
        if (!v15)
        {
          uint64_t v8 = 12;
LABEL_31:
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
          if ((unint64_t)qword_1001D7BE0 >> 1 == 0x595588BD12BF6FE8
            || ((unsigned int (*)(uint64_t (***)(), uint64_t))boost::system::detail::system_cat_holder<void>::instance[6])(&boost::system::detail::system_cat_holder<void>::instance, v8))
          {
            std::string::size_type v10 = 3;
          }
          else
          {
            std::string::size_type v10 = 2;
          }
          LODWORD(__p.__r_.__value_.__l.__data_) = v8;
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)&boost::system::detail::system_cat_holder<void>::instance;
          __p.__r_.__value_.__r.__words[2] = v10;
          goto LABEL_9;
        }
        uint64_t v7 = v15;
        bzero(v15, v20);
      }
      uint64_t v8 = readdir_r(v5, v7, &v27);
      if (v8) {
        goto LABEL_31;
      }
    }
    std::string::size_type v9 = v27;
    if (v27) {
      goto LABEL_14;
    }
    sub_10013E0AC((DIR **)&v4->d_name[27], (void **)&v4->d_name[35], &__p);
    LODWORD(v8) = __p.__r_.__value_.__l.__data_;
    std::string::size_type v10 = __p.__r_.__value_.__r.__words[2];
LABEL_9:
    uint64_t v28 = *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4);
    int v29 = HIDWORD(__p.__r_.__value_.__r.__words[1]);
    if ((v10 & 1) != 0 && (v10 != 1 || v8))
    {
      uint64_t v27 = *a1;
      uint64_t v18 = v27;
      *a1 = 0;
      sub_10013EBA8((char *)&v18->d_seekoff, &__p);
      if (!a2)
      {
        exception = __cxa_allocate_exception(0x30uLL);
        int v21 = v8;
        uint64_t v22 = v28;
        int v23 = v29;
        std::string::size_type v24 = v10;
        boost::filesystem::filesystem_error::filesystem_error(exception, "boost::filesystem::directory_iterator::operator++", &__p, &v21);
      }
      *(_DWORD *)a2 = v8;
      *(void *)(a2 + 4) = v28;
      *(_DWORD *)(a2 + 12) = v29;
      *(void *)(a2 + 16) = v10;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      p_p = (atomic_uint **)&v27;
      goto LABEL_42;
    }
LABEL_15:
    int v4 = *a1;
    BOOL v5 = *(DIR **)&(*a1)->d_name[27];
    if (!v5)
    {
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)*a1;
      *a1 = 0;
      p_p = (atomic_uint **)&__p;
LABEL_42:
      sub_100030C9C(p_p);
      goto LABEL_46;
    }
    if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_src = &__src;
    }
    else {
      p_src = (std::string *)__src.__r_.__value_.__r.__words[0];
    }
    if (p_src->__r_.__value_.__s.__data_[0] != 46) {
      break;
    }
    std::string::size_type v12 = (__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__src
        : (std::string *)__src.__r_.__value_.__r.__words[0];
    int v13 = v12->__r_.__value_.__s.__data_[1];
    if (v13)
    {
      if (v13 != 46) {
        break;
      }
      unint64_t v14 = (__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &__src
          : (std::string *)__src.__r_.__value_.__r.__words[0];
      if (v14->__r_.__value_.__s.__data_[2]) {
        break;
      }
    }
  }
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000173FC(&__p, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = __src;
  }
  sub_10013FDF0((std::string *)&v4->d_seekoff);
  sub_10013FB8C((uint64_t)&v4->d_seekoff, &__p);
  *(void *)&long long v17 = 0xFFFF00000000;
  *((void *)&v17 + 1) = 0xFFFF00000000;
  *(_OWORD *)&v4->d_name[11] = v17;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_46:
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__src.__r_.__value_.__l.__data_);
  }
}

void sub_10013EA58(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25)
{
}

void sub_10013EB7C(_Unwind_Exception *a1)
{
}

void sub_10013EB84(_Unwind_Exception *a1)
{
}

void sub_10013EB90(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x10013EB98);
  }
  sub_10001F4A8(a1);
}

void *sub_10013EBA8@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1;
  if (a1[23] < 0) {
    uint64_t v3 = *(char **)a1;
  }
  unint64_t v4 = sub_10013FE4C(a1);

  return sub_10004E7CC(a2, v3, &v3[v4], v4);
}

const char *sub_10013EBFC()
{
  return "generic";
}

uint64_t sub_10013EC08(uint64_t a1, unsigned int a2)
{
  return a2;
}

void *sub_10013EC18@<X0>(int __errnum@<W1>, void *a2@<X8>)
{
  uint64_t v3 = strerror(__errnum);
  if (v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = "Unknown error";
  }

  return sub_100018888(a2, v4);
}

const char *sub_10013EC64(int a1, int __errnum, char *a3, uint64_t a4)
{
  unint64_t v4 = a3;
  if (a4)
  {
    BOOL v5 = a3;
    size_t v6 = a4 - 1;
    if (a4 != 1)
    {
      uint64_t v7 = strerror(__errnum);
      if (!v7) {
        return "Unknown error";
      }
      strncpy(v4, v7, v6);
      BOOL v5 = &v4[v6];
    }
    char *v5 = 0;
  }
  return v4;
}

uint64_t sub_10013ECCC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  if (v4)
  {
    if (v4 == 1)
    {
      unint64_t v5 = sub_10013EE40(a1);
      uint64_t v7 = v6;
      v15[0] = v5;
      v15[1] = v6;
      uint64_t v13 = sub_10013EF68((unsigned int *)a2);
      uint64_t v14 = v8;
      if (((*(uint64_t (**)(uint64_t, unint64_t, uint64_t *))(*(void *)v7 + 32))(v7, v5, &v13) & 1) == 0) {
        return (*(uint64_t (**)(uint64_t, void *, void))(*(void *)v14 + 40))(v14, v15, v13);
      }
      return 1;
    }
    std::string::size_type v10 = (uint64_t (***)())a1[1];
  }
  else
  {
    std::string::size_type v10 = &boost::system::detail::system_cat_holder<void>::instance;
  }
  if (((uint64_t (*)(uint64_t (***)(), void, uint64_t))(*v10)[2])(v10, *(unsigned int *)a1, a2)) {
    return 1;
  }
  if (*(void *)(a2 + 8)) {
    uint64_t v11 = *(uint64_t (****)())(a2 + 8);
  }
  else {
    uint64_t v11 = &boost::system::detail::generic_cat_holder<void>::instance;
  }
  std::string::size_type v12 = (*v11)[3];

  return v12();
}

unint64_t sub_10013EE40(uint64_t *a1)
{
  uint64_t v1 = a1[2];
  if (v1)
  {
    if (v1 == 1)
    {
      uint64_t v2 = *a1;
      unint64_t v3 = *a1 & 0xFFFFFFFF00000000;
    }
    else
    {
      LODWORD(v2) = *(_DWORD *)a1;
      uint64_t v4 = a1[1];
      uint64_t v5 = *(void *)(v4 + 8);
      if (v5 == 0xB2AB117A257EDFD1)
      {
        std::system_category();
      }
      else if (v5 == 0xB2AB117A257EDFD0)
      {
        std::generic_category();
      }
      else if (!atomic_load_explicit((atomic_ullong *volatile)(v4 + 16), memory_order_acquire))
      {
        uint64_t v6 = operator new(0x10uLL);
        uint64_t v7 = 0;
        void *v6 = &off_1001BF710;
        v6[1] = v4;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v4 + 16), (unint64_t *)&v7, (unint64_t)v6);
        if (v7)
        {
          (*(void (**)(void *))(*v6 + 8))(v6);
          unint64_t v3 = 0;
          return v3 | v2;
        }
      }
      unint64_t v3 = 0;
    }
  }
  else
  {
    std::system_category();
    unint64_t v3 = 0;
    LODWORD(v2) = 0;
  }
  return v3 | v2;
}

uint64_t sub_10013EF68(unsigned int *a1)
{
  uint64_t v1 = *((void *)a1 + 1);
  uint64_t v2 = *a1;
  if (!v1) {
    goto LABEL_4;
  }
  uint64_t v3 = *(void *)(v1 + 8);
  if (v3 == 0xB2AB117A257EDFD1)
  {
    std::system_category();
    return v2;
  }
  if (v3 != 0xB2AB117A257EDFD0)
  {
    if (!atomic_load_explicit((atomic_ullong *volatile)(v1 + 16), memory_order_acquire))
    {
      uint64_t v5 = operator new(0x10uLL);
      uint64_t v6 = 0;
      void *v5 = &off_1001BF710;
      v5[1] = v1;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v1 + 16), (unint64_t *)&v6, (unint64_t)v5);
      if (v6) {
        (*(void (**)(void *))(*v5 + 8))(v5);
      }
    }
  }
  else
  {
LABEL_4:
    std::generic_category();
  }
  return v2;
}

void sub_10013F058(std::error_category *a1)
{
  std::error_category::~error_category(a1);

  operator delete(v1);
}

uint64_t sub_10013F080(uint64_t a1)
{
  return (***(uint64_t (****)(void))(a1 + 8))(*(void *)(a1 + 8));
}

uint64_t sub_10013F0A8(uint64_t a1)
{
  v3[0] = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 8))(*(void *)(a1 + 8));
  v3[1] = v1;
  return sub_10013EF68((unsigned int *)v3);
}

uint64_t sub_10013F0FC(std::error_category *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (const std::error_category *)*((void *)a3 + 1);
  if (v6 == a1)
  {
    std::string::size_type v9 = (uint64_t (***)())a1[1].__vftable;
    int v17 = *a3;
    uint64_t v18 = v9;
    return ((uint64_t (*)(uint64_t (***)(), uint64_t, int *))(*v9)[2])(v9, a2, &v17);
  }
  if (v6 == std::generic_category()) {
    goto LABEL_14;
  }
  uint64_t v7 = (void *)*((void *)a3 + 1);
  if (qword_1001D7BF8 == 0xB2AB117A257EDFD1)
  {
    explicit = std::system_category();
  }
  else if (qword_1001D7BF8 == 0xB2AB117A257EDFD0)
  {
    explicit = std::generic_category();
  }
  else
  {
    explicit = (void *)atomic_load_explicit(qword_1001D7C00, memory_order_acquire);
    if (!explicit)
    {
      explicit = operator new(0x10uLL);
      std::string::size_type v10 = 0;
      void *explicit = &off_1001BF710;
      explicit[1] = &boost::system::detail::generic_cat_holder<void>::instance;
      atomic_compare_exchange_strong(qword_1001D7C00, (unint64_t *)&v10, (unint64_t)explicit);
      if (v10)
      {
        (*(void (**)(void *))(*explicit + 8))(explicit);
        explicit = v10;
      }
    }
  }
  if (v7 == explicit)
  {
LABEL_14:
    int v17 = *a3;
    uint64_t v18 = &boost::system::detail::generic_cat_holder<void>::instance;
    goto LABEL_15;
  }
  if (v11)
  {
    std::string::size_type v12 = (uint64_t (***)())v11[1];
    int v17 = *a3;
    uint64_t v18 = v12;
LABEL_15:
    std::string::size_type v9 = (uint64_t (***)())a1[1].__vftable;
    return ((uint64_t (*)(uint64_t (***)(), uint64_t, int *))(*v9)[2])(v9, a2, &v17);
  }
  int v14 = ((uint64_t (*)(std::error_category *, uint64_t))a1->default_error_condition)(a1, a2);
  return *((void *)a3 + 1) == v15 && *a3 == v14;
}

uint64_t sub_10013F30C(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = (const std::error_category *)*((void *)a2 + 1);
  if (v6 == (const std::error_category *)a1)
  {
    uint64_t v9 = *a2;
    std::string::size_type v10 = *(uint64_t (****)())(a1 + 8);
    uint64_t v29 = 0;
    if ((unint64_t)v10[1] >> 1 == 0x595588BD12BF6FE8)
    {
      int v11 = v9 != 0;
      std::string::size_type v12 = v10;
    }
    else
    {
      int v11 = ((uint64_t (*)(uint64_t (***)(), uint64_t))(*v10)[6])(v10, v9);
      std::string::size_type v12 = *(uint64_t (****)())(a1 + 8);
    }
    BOOL v13 = v11 == 0;
    uint64_t v14 = 2;
    if (!v13) {
      uint64_t v14 = 3;
    }
    LODWORD(v29) = v9;
    int v30 = v10;
    uint64_t v31 = v14;
    return ((uint64_t (*)(uint64_t (***)(), uint64_t *, uint64_t))(*v12)[3])(v12, &v29, a3);
  }
  if (v6 == std::generic_category()) {
    goto LABEL_20;
  }
  uint64_t v7 = (void *)*((void *)a2 + 1);
  if (qword_1001D7BF8 == 0xB2AB117A257EDFD1)
  {
    explicit = std::system_category();
  }
  else if (qword_1001D7BF8 == 0xB2AB117A257EDFD0)
  {
    explicit = std::generic_category();
  }
  else
  {
    explicit = (void *)atomic_load_explicit(qword_1001D7C00, memory_order_acquire);
    if (!explicit)
    {
      explicit = operator new(0x10uLL);
      uint64_t v15 = 0;
      void *explicit = &off_1001BF710;
      explicit[1] = &boost::system::detail::generic_cat_holder<void>::instance;
      atomic_compare_exchange_strong(qword_1001D7C00, (unint64_t *)&v15, (unint64_t)explicit);
      if (v15)
      {
        (*(void (**)(void *))(*explicit + 8))(explicit);
        explicit = v15;
      }
    }
  }
  if (v7 == explicit)
  {
LABEL_20:
    uint64_t v20 = *a2;
    uint64_t v29 = 0;
    if ((unint64_t)qword_1001D7BF8 >> 1 == 0x595588BD12BF6FE8) {
      int v21 = v20 != 0;
    }
    else {
      int v21 = ((uint64_t (*)(uint64_t (***)(), uint64_t))boost::system::detail::generic_cat_holder<void>::instance[6])(&boost::system::detail::generic_cat_holder<void>::instance, v20);
    }
    uint64_t v22 = 2;
    if (v21) {
      uint64_t v22 = 3;
    }
    LODWORD(v29) = v20;
    int v30 = &boost::system::detail::generic_cat_holder<void>::instance;
    uint64_t v31 = v22;
    goto LABEL_36;
  }
  if (v16)
  {
    uint64_t v17 = *a2;
    uint64_t v18 = (uint64_t (***)())v16[1];
    uint64_t v29 = 0;
    if ((unint64_t)v18[1] >> 1 == 0x595588BD12BF6FE8) {
      int v19 = v17 != 0;
    }
    else {
      int v19 = ((uint64_t (*)(uint64_t (***)(), uint64_t))(*v18)[6])(v18, v17);
    }
    uint64_t v28 = 2;
    if (v19) {
      uint64_t v28 = 3;
    }
    LODWORD(v29) = v17;
    int v30 = v18;
    uint64_t v31 = v28;
LABEL_36:
    std::string::size_type v12 = *(uint64_t (****)())(a1 + 8);
    return ((uint64_t (*)(uint64_t (***)(), uint64_t *, uint64_t))(*v12)[3])(v12, &v29, a3);
  }
  int v23 = *(uint64_t (****)())(a1 + 8);
  BOOL v24 = v23 == &boost::system::detail::generic_cat_holder<void>::instance;
  BOOL v25 = v23[1] == (uint64_t (**)())qword_1001D7BF8;
  if (!qword_1001D7BF8) {
    BOOL v25 = v24;
  }
  if (!v25) {
    return 0;
  }
  equivalent_0 = (uint64_t (*)(void))std::generic_category()->equivalent_0;

  return equivalent_0();
}

uint64_t sub_10013F698(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 32))();
}

uint64_t sub_10013F6C0()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1001D8038, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1001D8038))
  {
    qword_1001D8030 = sub_10013F734();
    __cxa_guard_release(&qword_1001D8038);
  }
  return qword_1001D8030;
}

void sub_10013F71C(_Unwind_Exception *a1)
{
}

uint64_t sub_10013F734()
{
  *__error() = 0;
  uint64_t v0 = pathconf("/", 5);
  if ((unint64_t)v0 <= 0x400) {
    uint64_t v1 = 1024;
  }
  else {
    uint64_t v1 = v0;
  }
  if (v0 >= 0) {
    return v1;
  }
  else {
    return 1024;
  }
}

int *sub_10013F774@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, int *a3@<X8>)
{
  uint64_t v4 = a1;
  if (a2)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  double result = (int *)stat(a1, &v17);
  if (result)
  {
    double result = __error();
    uint64_t v7 = *result;
    if (a2)
    {
      if ((unint64_t)qword_1001D7BE0 >> 1 == 0x595588BD12BF6FE8) {
        double result = (int *)(v7 != 0);
      }
      else {
        double result = (int *)((uint64_t (*)(uint64_t (***)(), uint64_t))boost::system::detail::system_cat_holder<void>::instance[6])(&boost::system::detail::system_cat_holder<void>::instance, v7);
      }
      uint64_t v11 = 2;
      if (result) {
        uint64_t v11 = 3;
      }
      *(_DWORD *)a2 = v7;
      *(_DWORD *)(a2 + 4) = 0;
      *(void *)(a2 + 8) = &boost::system::detail::system_cat_holder<void>::instance;
      *(void *)(a2 + 16) = v11;
      if (v7 == 20) {
        int v12 = 0;
      }
      else {
        int v12 = 0xFFFF;
      }
      int v9 = v7 == 2 || v7 == 20;
      if (v7 == 2) {
        int v8 = 0;
      }
      else {
        int v8 = v12;
      }
    }
    else
    {
      if (v7 != 2 && v7 != 20)
      {
        exception = __cxa_allocate_exception(0x30uLL);
        v16[0] = 0;
        if ((unint64_t)qword_1001D7BE0 >> 1 == 0x595588BD12BF6FE8) {
          int v14 = v7 != 0;
        }
        else {
          int v14 = ((uint64_t (*)(uint64_t (***)(), uint64_t))boost::system::detail::system_cat_holder<void>::instance[6])(&boost::system::detail::system_cat_holder<void>::instance, v7);
        }
        uint64_t v15 = 2;
        LODWORD(v16[0]) = v7;
        if (v14) {
          uint64_t v15 = 3;
        }
        v16[1] = &boost::system::detail::system_cat_holder<void>::instance;
        v16[2] = v15;
        boost::filesystem::filesystem_error::filesystem_error(exception, "boost::filesystem::status", v4, v16);
      }
      int v8 = 0;
      int v9 = 1;
    }
  }
  else
  {
    int v8 = 0xFFFF;
    int v9 = 10;
    switch(((v17.st_mode & 0xF000u) - 4096) >> 12)
    {
      case 0u:
        int v8 = v17.st_mode & 0xFFF;
        int v9 = 7;
        break;
      case 1u:
        int v8 = v17.st_mode & 0xFFF;
        int v9 = 6;
        break;
      case 3u:
        int v8 = v17.st_mode & 0xFFF;
        int v9 = 3;
        break;
      case 5u:
        int v8 = v17.st_mode & 0xFFF;
        int v9 = 5;
        break;
      case 7u:
        int v8 = v17.st_mode & 0xFFF;
        int v9 = 2;
        break;
      case 0xBu:
        int v8 = v17.st_mode & 0xFFF;
        int v9 = 8;
        break;
      default:
        break;
    }
  }
  *a3 = v9;
  a3[1] = v8;
  return result;
}

void sub_10013F9CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

off_t sub_10013FA10(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if (a2)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  if (*(char *)(a1 + 23) < 0) {
    a1 = *(void *)a1;
  }
  if (stat((const char *)a1, &v6) < 0)
  {
    uint64_t v5 = *__error();
LABEL_11:
    sub_10013D4B0(v5, v3, (uint64_t)a2, (uint64_t)"boost::filesystem::file_size");
    return -1;
  }
  if ((v6.st_mode & 0xF000) != 0x8000)
  {
    uint64_t v5 = 78;
    goto LABEL_11;
  }
  return v6.st_size;
}

__darwin_time_t sub_10013FAAC(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if (a2)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  if (*(char *)(a1 + 23) < 0) {
    a1 = *(void *)a1;
  }
  if ((stat((const char *)a1, &v6) & 0x80000000) == 0) {
    return v6.st_mtimespec.tv_sec;
  }
  uint64_t v5 = __error();
  sub_10013D4B0(*v5, v3, (uint64_t)a2, (uint64_t)"boost::filesystem::last_write_time");
  return 0x8000000000000000;
}

uint64_t sub_10013FB28(uint64_t a1)
{
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    uint64_t v1 = *(unsigned __int8 *)(a1 + 23);
    if (!*(unsigned char *)(a1 + 23)) {
      return 0;
    }
    uint64_t v2 = a1 + v1;
LABEL_6:
    if (*(unsigned char *)(v2 - 1) != 47)
    {
      std::string::push_back((std::string *)a1, 47);
      return v1;
    }
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    uint64_t v2 = *(void *)a1 + v1;
    goto LABEL_6;
  }
  return v1;
}

void sub_10013FB8C(uint64_t a1, const std::string *a2)
{
  int v3 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
  if (v3 >= 0) {
    unint64_t size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  else {
    unint64_t size = a2->__r_.__value_.__l.__size_;
  }
  if (size)
  {
    if ((const std::string *)a1 == a2)
    {
      if (v3 < 0)
      {
        sub_1000173FC(__n, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)__n = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
        std::string::size_type v17 = a2->__r_.__value_.__r.__words[2];
      }
      sub_10013FB8C(a2, __n);
      if (SHIBYTE(v17) < 0) {
        operator delete((void *)__n[0]);
      }
    }
    else
    {
      if (v3 >= 0) {
        stat v6 = (std::string *)a2;
      }
      else {
        stat v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
      }
      __n[0] = 0;
      if (sub_10013FD58(v6, size, __n) < size)
      {
LABEL_25:
        std::string::operator=((std::string *)a1, a2);
        return;
      }
      unint64_t v18 = 0;
      if (*(char *)(a1 + 23) < 0)
      {
        int v8 = *(unsigned char **)a1;
        unint64_t v7 = *(void *)(a1 + 8);
      }
      else
      {
        unint64_t v7 = *(unsigned __int8 *)(a1 + 23);
        int v8 = (unsigned char *)a1;
      }
      sub_10013FD58(v8, v7, &v18);
      size_t v9 = __n[0];
      if (__n[0])
      {
        if (__n[0] != v18) {
          goto LABEL_25;
        }
        std::string::size_type v10 = (unsigned char *)a1;
        if (*(char *)(a1 + 23) < 0) {
          std::string::size_type v10 = *(unsigned char **)a1;
        }
        int v11 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
        int v12 = (uint64_t *)a2->__r_.__value_.__r.__words[0];
        BOOL v13 = v11 >= 0 ? (uint64_t *)a2 : (uint64_t *)a2->__r_.__value_.__r.__words[0];
        if (memcmp(v10, v13, __n[0])) {
          goto LABEL_25;
        }
      }
      else
      {
        LOBYTE(v11) = *((unsigned char *)&a2->__r_.__value_.__s + 23);
        int v12 = (uint64_t *)a2->__r_.__value_.__r.__words[0];
      }
      if ((v11 & 0x80u) == 0) {
        int v14 = a2;
      }
      else {
        int v14 = (const std::string *)v12;
      }
      uint64_t v15 = (char *)v14 + v9;
      if (v14->__r_.__value_.__s.__data_[v9] != 47) {
        sub_10013FB28(a1);
      }
      std::string::append((std::string *)a1, v15, size - v9);
    }
  }
  else if (sub_10013FF30((unsigned char *)a1))
  {
    std::string::push_back((std::string *)a1, 47);
  }
}

void sub_10013FD3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_10013FD58(unsigned char *__s, unint64_t a2, unint64_t *a3)
{
  *a3 = 0;
  if (a2 && *__s == 47)
  {
    if (a2 < 2 || __s[1] != 47) {
      return 0;
    }
    size_t v4 = a2 - 2;
    if (a2 != 2)
    {
      uint64_t v5 = __s + 2;
      if (__s[2] == 47) {
        return 0;
      }
      unint64_t v7 = memchr(v5, 47, v4);
      size_t v8 = v7 - v5;
      if (!v7) {
        size_t v8 = v4;
      }
      a2 = v8 + 2;
    }
    *a3 = a2;
  }
  return a2;
}

std::string *sub_10013FDF0(std::string *a1)
{
  std::string::size_type v2 = sub_10013FE4C(a1);
  if (SHIBYTE(a1->__r_.__value_.__r.__words[2]) < 0)
  {
    size_t v4 = (std::string *)a1->__r_.__value_.__r.__words[0];
    std::string::size_type v3 = a1->__r_.__value_.__r.__words[0] + a1->__r_.__value_.__l.__size_;
  }
  else
  {
    std::string::size_type v3 = (std::string::size_type)a1 + HIBYTE(a1->__r_.__value_.__r.__words[2]);
    size_t v4 = a1;
  }
  std::string::erase(a1, v2, v3 - (void)v4 - v2);
  return a1;
}

unint64_t sub_10013FE4C(unsigned char *a1)
{
  uint64_t v1 = a1;
  if ((char)a1[23] < 0)
  {
    a1 = *(unsigned char **)a1;
    unint64_t v2 = *((void *)v1 + 1);
  }
  else
  {
    unint64_t v2 = a1[23];
  }
  unint64_t v16 = 0;
  unint64_t v3 = sub_10013FD58(a1, v2, &v16);
  int v4 = (char)v1[23];
  if (v2 >= v16) {
    unint64_t v5 = v16;
  }
  else {
    unint64_t v5 = v2;
  }
  if (v4 >= 0) {
    stat v6 = v1;
  }
  else {
    stat v6 = *(unsigned char **)v1;
  }
  unint64_t v7 = v6 - 1;
  unint64_t v8 = v2;
  while (v8 > v16)
  {
    unint64_t v9 = v8 - 1;
    int v10 = v7[v8--];
    if (v10 == 47)
    {
      unint64_t v5 = v9 + 1;
      break;
    }
  }
  if (v5 >= v16) {
    unint64_t v11 = v16;
  }
  else {
    unint64_t v11 = v5;
  }
  if (v4 >= 0) {
    int v12 = v1;
  }
  else {
    int v12 = *(unsigned char **)v1;
  }
  BOOL v13 = v12 - 1;
  unint64_t v14 = v5;
  while (v14 > v16)
  {
    if (v13[v14] != 47) {
      return v14;
    }
    if (v3 == --v14)
    {
      if (v2 == v5) {
        return v3;
      }
      else {
        return v3 + 1;
      }
    }
  }
  if (v2 == v5) {
    return 0;
  }
  else {
    return v11;
  }
}

unint64_t sub_10013FF30(unsigned char *a1)
{
  uint64_t v1 = a1;
  if ((char)a1[23] < 0)
  {
    a1 = *(unsigned char **)a1;
    unint64_t v2 = *((void *)v1 + 1);
  }
  else
  {
    unint64_t v2 = a1[23];
  }
  unint64_t v10 = 0;
  sub_10013FD58(a1, v2, &v10);
  if (v2 >= v10) {
    unint64_t v3 = v10;
  }
  else {
    unint64_t v3 = v2;
  }
  if ((char)v1[23] >= 0) {
    int v4 = v1;
  }
  else {
    int v4 = *(unsigned char **)v1;
  }
  unint64_t v5 = v4 - 1;
  unint64_t v6 = v2;
  while (v6 > v10)
  {
    unint64_t v7 = v6 - 1;
    int v8 = v5[v6--];
    if (v8 == 47)
    {
      unint64_t v3 = v7 + 1;
      return v2 - v3;
    }
  }
  return v2 - v3;
}

uint64_t sub_10013FFC8(uint64_t a1)
{
  if (qword_1001D8078)
  {
    std::locale::~locale((std::locale *)qword_1001D8078);
    operator delete(v2);
  }
  qword_1001D8078 = 0;
  return a1;
}

uint64_t sub_100140004()
{
  __cxa_atexit((void (*)(void *))sub_10013FFC8, &unk_1001D8040, (void *)&_mh_execute_header);
  sub_100018888(qword_1001D8048, ".");
  __cxa_atexit((void (*)(void *))sub_10013D47C, qword_1001D8048, (void *)&_mh_execute_header);
  sub_100018888(qword_1001D8060, "..");

  return __cxa_atexit((void (*)(void *))sub_10013D47C, qword_1001D8060, (void *)&_mh_execute_header);
}

void sub_1001400BC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMBasebandMetricsController]:#D Failed to convert event name", v2, v3, v4, v5, v6);
}

void sub_1001400F0(uint64_t *a1, NSObject *a2)
{
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = (uint64_t *)*a1;
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMBasebandMetricsController]:#D Received event %s", (uint8_t *)&v3, 0xCu);
}

void sub_100140178()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMBasebandMetricsController]:Failed to initialize parent", v1, 2u);
}

void sub_1001401B8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMBasebandMetricsController]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_1001401EC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMBasebandMetricsController]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_100140220()
{
  sub_10001FDAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMBasebandMetricsController]:#D Metric name: %@, payload %@", v2, 0x16u);
}

void sub_1001402A4()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMBasebandMetricsController]:Failed to convert incoming metric: %@", v1, 0xCu);
}

void sub_100140318()
{
  sub_10001FDAC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMBasebandMetricsController]:#D Received metric callback for metric %@", v1, 0xCu);
}

void sub_10014038C()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMBasebandMetricsController]:Failed to extract at least one required field from dict for congestion metric: %@", v1, 0xCu);
}

void sub_100140400()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCongestionModel]:Failed to initialize parent", v1, 2u);
}

void sub_100140440()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100140474()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_1001404A8()
{
  sub_10001FDAC();
  sub_100021DF4((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:Failed to allocate state for context %@", v2, v3, v4, v5, v6);
}

void sub_100140510(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCongestionModel]:#D Initializing context %@", buf, 0xCu);
}

void sub_100140568(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCongestionModel]:#D Updating context %@", buf, 0xCu);
}

void sub_1001405C0()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Received nil cell monitor update for context %@", v2, v3, v4, v5, v6);
}

void sub_100140628()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Received cell monitor update for unknown context %@", v2, v3, v4, v5, v6);
}

void sub_100140690()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Skipping further processing for: %@", v2, v3, v4, v5, v6);
}

void sub_1001406F8(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCongestionModel]:#D Failed to extract FMCongestionCell from cell info for context %@: %@", buf, 0x16u);
}

void sub_100140760()
{
  sub_10001FDAC();
  sub_100021DF4((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:Congestion area in unexpected state after cell change: %@", v2, v3, v4, v5, v6);
}

void sub_1001407C8()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Finalized congestion area: %@", v2, v3, v4, v5, v6);
}

void sub_100140830()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCongestionModel]:Failed to extract congestion metric, aborting", v1, 2u);
}

void sub_100140870()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Received congestion metric: %@", v2, v3, v4, v5, v6);
}

void sub_1001408D8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Starting new congestion area", v2, v3, v4, v5, v6);
}

void sub_10014090C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Congestion metric matched relevant cell", v2, v3, v4, v5, v6);
}

void sub_100140940()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Congestion metric did not match relevant cell", v2, v3, v4, v5, v6);
}

void sub_100140974()
{
  sub_10001FDAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCongestionModel]:#D Previously stored cell for %@: %@", v2, 0x16u);
}

void sub_1001409F8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:#D Location not authorized, skipping RLGS event submission", v2, v3, v4, v5, v6);
}

void sub_100140A2C()
{
  sub_10001FDAC();
  sub_100021DF4((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:Received prediction in unexpected state %@", v2, v3, v4, v5, v6);
}

void sub_100140A94()
{
  sub_10001FDAC();
  sub_100021DF4((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionModel]:Received area in unexpected state %@", v2, v3, v4, v5, v6);
}

void sub_100140AFC()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMRegulatoryDomainController]:Failed to initialize parent", v1, 2u);
}

void sub_100140B3C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMRegulatoryDomainController]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100140B70()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMRegulatoryDomainController]:Failed to register for regulatory domain update notification, aborting", v1, 2u);
}

void sub_100140BB0()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMRegulatoryDomainController]:#D Received notification for regulatory domain country, updating", v2, v3, v4, v5, v6);
}

void sub_100140BE4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMRegulatoryDomainController]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_100140C18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMRegulatoryDomainController]:#D Regulatory domain estimates: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100140C90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMUtil]:#D Received notification for first unlock", v1, 2u);
}

void sub_100140CD4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMUtil]:#D Received notification for lock status", v1, 2u);
}

void sub_100140D18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMGEOServicesHandler]:Crowdsourced OOS learnings: unable to get reference to WISGeoServicesHandler", v1, 2u);
}

void sub_100140D5C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D No change in primary or secondary network interface", v2, v3, v4, v5, v6);
}

void sub_100140D90()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "RatDataUsageMetric:Could not fetch byte counters for secondary %@", v1, 0xCu);
}

void sub_100140E04()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "RatDataUsageMetric:Could not fetch counters for primary %@", v1, 0xCu);
}

void sub_100140E78()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Raw cellular radio tech changed to %@", v2);
}

void sub_100140EE4()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Registration status changed to %@", v2);
}

void sub_100140F50()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Not submitting CA event, invalid duration", v2, v3, v4, v5, v6);
}

void sub_100140F84()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:Not submitting CA event, byte counters are nil", v2, v3, v4, v5, v6);
}

void sub_100140FB8()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Duration too short %llu, skipping submission", v2);
}

void sub_100141024()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Invalid data mode, skipping submission", v2, v3, v4, v5, v6);
}

void sub_100141058()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:Invalid measures for secondary network interface", v2, v3, v4, v5, v6);
}

void sub_10014108C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:Invalid measures for primary network interface", v2, v3, v4, v5, v6);
}

void sub_1001410C0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatDataUsageMetric:Failed to fetch current data context %@", v5);
}

void sub_100141104()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatDataUsageMetric:Failed to fetch registration display status: %@", v5);
}

void sub_100141148()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatDataUsageMetric:Failed to fetch interface expensive: %@", v5);
}

void sub_10014118C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatDataUsageMetric:Failed to fetch low data mode: %@", v5);
}

void sub_1001411D0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatDataUsageMetric:Failed to fetch registration state: %@", v5);
}

void sub_100141214()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v3, (uint64_t)v3, "RatDataUsageMetric:#D Populating info for context %@", v4);
}

void sub_10014125C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Data population retry unsuccessful", v2, v3, v4, v5, v6);
}

void sub_100141290()
{
  sub_10001FDAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "RatDataUsageMetric:#D primary interface: %@, secondary interface %@", v2, 0x16u);
}

void sub_100141314()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Path monitor update received, but initial data population not done, retrying", v2, v3, v4, v5, v6);
}

void sub_100141348()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Path monitor update: %@", v2);
}

void sub_1001413B4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D subscriptionInfoDidChange", v2, v3, v4, v5, v6);
}

void sub_1001413E8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D currentDataContextChanged", v2, v3, v4, v5, v6);
}

void sub_10014141C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v3, (uint64_t)v3, "RatDataUsageMetric:#D Received registration state update for non-data context %@", v4);
}

void sub_100141464()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v3, (uint64_t)v3, "RatDataUsageMetric:#D Received RAT update for non-data context %@", v4);
}

void sub_1001414AC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v3, (uint64_t)v3, "RatDataUsageMetric:#D Received low data mode update for non-data context %@", v4);
}

void sub_1001414F4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v3, (uint64_t)v3, "RatDataUsageMetric:#D Received interface expensive update for non-data context %@", v4);
}

void sub_10014153C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v3, (uint64_t)v3, "RatDataUsageMetric:#D Received satellite registration state update for non-data context %@", v4);
}

void sub_100141584()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatDataUsageMetric:#D Emergency satellite state changed to %@", v2);
}

uint64_t sub_1001415F0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t sub_100141628(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_100141660()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "Unable to get the request tracker", v2, v3, v4, v5, v6);
}

void sub_100141694()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "Received null tile data", v2, v3, v4, v5, v6);
}

void sub_1001416C8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "Got null data in the received tile", v2, v3, v4, v5, v6);
}

void sub_1001416FC()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "Unable to serialize the received tile data", v2, v3, v4, v5, v6);
}

void sub_100141730()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "Unable to create the CellularCoverageTileConfiguration object", v2, v3, v4, v5, v6);
}

void sub_100141764(os_log_t log, double a2, double a3)
{
  int v3 = 134283777;
  double v4 = a2;
  __int16 v5 = 2049;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#D Handling received results for latitude: %{private}lf, longitude: %{private}lf", (uint8_t *)&v3, 0x16u);
}

void sub_1001417EC()
{
  sub_100031540(__stack_chk_guard);
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = v0;
  sub_100031558((void *)&_mh_execute_header, v1, v2, "file.helpers:Unable to open metric file %s (fail).", v3);
}

void sub_100141858()
{
  sub_100031540(__stack_chk_guard);
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = v0;
  sub_100031558((void *)&_mh_execute_header, v1, v2, "file.helpers:Unable to open metric file %s for reading (fail)", v3);
}

void sub_1001418C4(char *a1, void *a2, NSObject *a3)
{
  if (*a1 >= 0) {
    double v4 = a2;
  }
  else {
    double v4 = (void *)*a2;
  }
  int v5 = *__error();
  int v6 = 136315394;
  unint64_t v7 = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "file.helpers:Delete failed for %s (errno=%d)", (uint8_t *)&v6, 0x12u);
}

void sub_100141970(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100141994()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+OOSPredictor]:Failed to get new background context", v2, v3, v4, v5, v6);
}

void sub_1001419C8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+OOSPredictor]:Failed to get / create OOS area, aborting", v2, v3, v4, v5, v6);
}

void sub_1001419FC()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+OOSPredictor]:Failed to retrieve LocationOfInterest to update OutOfServiceAreas with", v2, v3, v4, v5, v6);
}

void sub_100141A30()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+OOSPredictor]:Failed to generate cutoff date to fetch OutOfServiceAreas to be updated", v2, v3, v4, v5, v6);
}

void sub_100141A64()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+OOSPredictor]:Could not retrieve OutOfServiceAreas to update with next visit", v2, v3, v4, v5, v6);
}

void sub_100141A98(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+OOSPredictor]:Error while saving OutOfServiceAreas after next visit update: %@", buf, 0xCu);
}

void sub_100141AF0()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:Failed to initialize parent", v2, v3, v4, v5, v6);
}

void sub_100141B24()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100141B58()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_100141B8C()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMTimeSeriesModel]:Context does not have a PLMN, skipping: %@", v1, 0xCu);
}

void sub_100141C00()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMTimeSeriesModel]:Failed to allocate state for context %@", v1, 0xCu);
}

void sub_100141C74(void *a1, void *a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMTimeSeriesModel]:#D Initializing context %@ with home PLMN %@", v5, 0x16u);
}

void sub_100141CD4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100036074((void *)&_mh_execute_header, a2, a3, "FederatedMobility[FMTimeSeriesModel]:#D Updating context %@", (uint8_t *)a2);
}

void sub_100141D20(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMTimeSeriesModel]:#D Airplane mode status switched to %{BOOL}d", (uint8_t *)v2, 8u);
}

void sub_100141D9C()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Received nil cell monitor update for context %@", v2, v3, v4, v5, v6);
}

void sub_100141E04()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Received cell monitor update for unknown context %@", v2, v3, v4, v5, v6);
}

void sub_100141E6C(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100036090(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMTimeSeriesModel]:#D Failed to extract FMServingCell from cell info for context %@: %@", v4, 0x16u);
}

void sub_100141EC4()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Received display status change for unknown context %@", v2, v3, v4, v5, v6);
}

void sub_100141F2C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Airplane mode active, ignoring registration state change", v2, v3, v4, v5, v6);
}

void sub_100141F60()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D No existing anomaly for OOS, skipping", v2, v3, v4, v5, v6);
}

void sub_100141F94()
{
  sub_10001FDAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMTimeSeriesModel]:#D Received display status change for context %@: %@", v2, 0x16u);
}

void sub_100142018()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Received nil signal strength update for context %@", v2, v3, v4, v5, v6);
}

void sub_100142080()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:Failed to extract congestion metric, aborting", v2, v3, v4, v5, v6);
}

void sub_1001420B4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D No existing anomaly for congestion, skipping", v2, v3, v4, v5, v6);
}

void sub_1001420E8()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Marking prediction %@ as correct", v2, v3, v4, v5, v6);
}

void sub_100142150()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Anomaly of type %@ already active", v2, v3, v4, v5, v6);
}

void sub_1001421B8()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D New anomaly %@", v2, v3, v4, v5, v6);
}

void sub_100142220()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Ending anomaly %@", v2, v3, v4, v5, v6);
}

void sub_100142288()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Cutoff would be negative, not removing any events", v2, v3, v4, v5, v6);
}

void sub_1001422BC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100036074((void *)&_mh_execute_header, a2, a3, "FederatedMobility[FMTimeSeriesModel]:#D Skipping predictions for state with PLMN %@ since last prediction was after last event change", (uint8_t *)a2);
}

void sub_100142308(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100036074((void *)&_mh_execute_header, a2, a3, "FederatedMobility[FMTimeSeriesModel]:#D Skipping predictions for state with PLMN %@ since last prediction was not long enough ago", (uint8_t *)a2);
}

void sub_100142354()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:Failed to fetch predictions", v2, v3, v4, v5, v6);
}

void sub_100142388()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Fetching time-series predictions", v2, v3, v4, v5, v6);
}

void sub_1001423BC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Maximum time until the predicted anomaly must have occurred is larger than the current time, skipping", v2, v3, v4, v5, v6);
}

void sub_1001423F0()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMTimeSeriesModel]:#D Finished prediction: %@", v2, v3, v4, v5, v6);
}

void sub_100142458()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:Failed to get new background context", v2, v3, v4, v5, v6);
}

void sub_10014248C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:Failed to get / create congestion area, aborting", v2, v3, v4, v5, v6);
}

void sub_1001424C0()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:Cannot fetch predictions, context is nil", v2, v3, v4, v5, v6);
}

void sub_1001424F4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:#D Retrieving congestion predictions", v2, v3, v4, v5, v6);
}

void sub_100142528()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:#D At least one prevCell not in DB, therefore no predictions available", v2, v3, v4, v5, v6);
}

void sub_10014255C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:#D No matching CongestionArea found for recovery after filtering", v2, v3, v4, v5, v6);
}

void sub_100142590()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:#D More than one filtered CongestionArea result, sorting for predictions", v2, v3, v4, v5, v6);
}

void sub_1001425C4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+CongestionPredictor]:Error while fetching CongestionArea: %@", buf, 0xCu);
}

void sub_10014261C(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+CongestionPredictor]:#D a: %d, b: %d", buf, 0xEu);
}

void sub_100142674()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+CongestionPredictor]:#D Cannot create FMCongestionPrediction for CongestionArea: No occurrences", v2, v3, v4, v5, v6);
}

void sub_1001426A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "main:Enable to start XPC Server %@", (uint8_t *)&v2, 0xCu);
}

void sub_100142720(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "main:Error setting jetsam priority: %d", (uint8_t *)v2, 8u);
}

void sub_100142798()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreTelephonyController]:#D Failed to initialize parent", v2, v3, v4, v5, v6);
}

void sub_1001427CC()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreTelephonyController]:TelephonyStateRelay coreTelephonyClient is nil", v1, 2u);
}

void sub_10014280C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreTelephonyController]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100142840()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreTelephonyController]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_100142874(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreTelephonyController]:#D Returning %lu subscriptions in use", buf, 0xCu);
}

void sub_1001428BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreTelephonyController]:#D Cannot retrieve context for UUID %@", (uint8_t *)&v2, 0xCu);
}

void sub_100142934(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreTelephonyController]:Error while fetching registration status: %@", buf, 0xCu);
}

void sub_10014298C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreTelephonyController]:#D kSubscriptionInfoDidChange", v2, v3, v4, v5, v6);
}

void sub_1001429C0()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreTelephonyController]:#D kPlmnChanged", v2, v3, v4, v5, v6);
}

void sub_1001429F4()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreTelephonyController]:Received CTSubscriptionSlotUnknown to map to a subscriptionID. This should not happen", v1, 2u);
}

void sub_100142A34()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreTelephonyController]:#D subscriptionsInUse is nil", v2, v3, v4, v5, v6);
}

void sub_100142A68(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreTelephonyController]:#D Updated uuidToContextMap with %lu subscription contexts", buf, 0xCu);
}

void sub_100142AB0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreTelephonyController]:Unable to fetch subscription info: %@", buf, 0xCu);
}

void sub_100142B08()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "SignalBarMetric:TelephonyStateRelay coreTelephonyClient is nil", v2, v3, v4, v5, v6);
}

void sub_100142B3C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SignalBarMetric:PLMN part <= 0: %ld", (uint8_t *)&v2, 0xCu);
}

void sub_100142BB4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "SignalBarMetric:Unable to find any subscriptions that are in use", v2, v3, v4, v5, v6);
}

void sub_100142BE8()
{
  sub_100027354();
  sub_1000479BC(v1, v2, v3, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v6, v4, "SignalBarMetric:#D Ignoring non-SIM context %@", v5);
}

void sub_100142C34()
{
  sub_100027354();
  sub_1000479BC(v1, v2, v3, 5.7779e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "SignalBarMetric:Could not allocate state for context %@", v4, 0xCu);
}

void sub_100142C88()
{
  sub_100027354();
  sub_1000479BC(v1, v2, v3, 5.7779e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "SignalBarMetric:Error while fetching registration display status: %@", v4, 0xCu);
}

void sub_100142CDC()
{
  sub_100027354();
  sub_1000479BC(v1, v2, v3, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v6, v4, "SignalBarMetric:#D Initializing data for context %@", v5);
}

void sub_100142D28()
{
  sub_100027354();
  sub_1000479BC(v1, v2, v3, 5.7779e-34);
  sub_100027360((void *)&_mh_execute_header, v6, v4, "SignalBarMetric:#D Skipping initialization for existing context %@", v5);
}

void sub_100142D74(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100027360((void *)&_mh_execute_header, a2, a3, "SignalBarMetric:#D Removing state for contexts: %@", (uint8_t *)&v3);
}

void sub_100142DE4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:Unable to fetch current data subscription context: %@", v5);
}

void sub_100142E28()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:Unable to fetch the subscription info: %@", v5);
}

void sub_100142E6C()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "SignalBarMetric:#D Subscription info changed", v1, 2u);
}

void sub_100142EAC()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "SignalBarMetric:Invalid subscription context or signal strength info", v2, v3, v4, v5, v6);
}

void sub_100142EE0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:#D Received signal strength change callback for unknown context: %@", v5);
}

void sub_100142F24()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:#D Received signal strength callback for context %@ but signal strength did not change", v5);
}

void sub_100142F68(void *a1, void *a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SignalBarMetric:#D Signal strength of context %@ changed: %@ bars", v5, 0x16u);
}

void sub_100142FC8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:#D Received PLMN change callback for unknown context: %@", v5);
}

void sub_10014300C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:Aborting PLMN change update due to error while converting MCC: %@", v5);
}

void sub_100143050()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:Aborting PLMN change update due to error while converting MNC: %@", v5);
}

void sub_100143094()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "SignalBarMetric:Context and/or plmn info is null", v2, v3, v4, v5, v6);
}

void sub_1001430C8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:#D Received display status change callback for unknown context: %@", v5);
}

void sub_10014310C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SignalBarMetric:#D Display status of context %@ changed. Status: %@", v4, 0x16u);
}

void sub_100143164()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "SignalBarMetric:Received invalid context for data SIM change", v2, v3, v4, v5, v6);
}

void sub_100143198()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:#D Current data context changed to %@", v5);
}

void sub_1001431DC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "SignalBarMetric:#D Current data context changed to %@, but we did not successfully initialize. Running initialization", v5);
}

void sub_100143220(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = off_1001D6E90;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#D %@: initialized trialClient for Wireless project ID", (uint8_t *)&v1, 0xCu);
}

void sub_1001432A4(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = off_1001D6E90;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#D %@: Initializing WISTrialExperimentsManager", (uint8_t *)&v1, 0xCu);
}

void sub_100143328(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "file:#D Metric File(%s, %d): skipping because no such file id", buf, 0x12u);
}

void sub_100143380(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  if (*((char *)a1 + 23) >= 0) {
    os_log_t v4 = a1;
  }
  else {
    os_log_t v4 = (uint64_t *)*a1;
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
  int v6 = 136315394;
  unint64_t v7 = v4;
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "snapshotter:Error linking log files from '%s': %s", (uint8_t *)&v6, 0x16u);
}

void sub_10014344C(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_10004EF3C())
  {
    (*(void (**)(uint64_t))(*(void *)v1 + 16))(v1);
    sub_10004EF5C((void *)&_mh_execute_header, v2, v3, "snapshotter:#E EXCEPT: filesystem_error('%s')", v4, v5, v6, v7, 2u);
  }
}

void sub_1001434F8(NSObject **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (v3) {
    dispatch_release(v3);
  }
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_100143534(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "agg:#D Got trigger from source 0x%x with triggering component id 0x%x (they're different!).  Using triggering component id.", (uint8_t *)v3, 0xEu);
}

void sub_1001435BC(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    __int16 v4 = a1;
  }
  else {
    __int16 v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "timer:#D ****** Check in: Existing criteria %s *********", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100143630()
{
  sub_1000598E4(__stack_chk_guard);
  sub_100059908();
  sub_100059920((void *)&_mh_execute_header, v0, v1, "config:#D Internal Hotship detected: %d; (%s)", v2, v3);
}

void sub_100143698()
{
  sub_1000598E4(__stack_chk_guard);
  sub_100059908();
  sub_100059920((void *)&_mh_execute_header, v0, v1, "config:#D Carrier Hotship detected: %d; (%s)", v2, v3);
}

uint64_t sub_100143700(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

uint64_t sub_100143724(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
}

void sub_10014375C(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "caobserver:WISCoreAnalyticsObserver received nil or invalid(%@) event: %@", (uint8_t *)a3, 0x16u);
}

void sub_1001437D4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "caobserver:Error while parsing received CA event: %@", buf, 0xCu);
}

void sub_10014382C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "caobserver:WISCoreAnalyticsObserver received CA event with a null eventName and/or Payload", v1, 2u);
}

void sub_100143870(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:#D Insufficient number of observed events to store anomaly: %@ for homePLMN %@", (uint8_t *)&v3, 0x16u);
}

void sub_1001438F8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:Failed to get new background context", v2, v3, v4, v5, v6);
}

void sub_10014392C()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:#D Insufficient amount of observed events, no predictions", v1, 2u);
}

void sub_10014396C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:Cannot fetch predictions, context is nil", v2, v3, v4, v5, v6);
}

void sub_1001439A0()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:#D Retrieving time-series predictions", v1, 2u);
}

void sub_1001439E0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:#D Final predictions: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100143A64(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:Error while fetching TSAnomalies: %@", buf, 0xCu);
}

void sub_100143ABC()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:observedTimestamp is larger than baseTimestamp, aborting", v2, v3, v4, v5, v6);
}

void sub_100143AF0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:Observed event timestamp is larger than current time, skipping", buf, 2u);
}

void sub_100143B30(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:#D Skipping event since it is outside the prediction window overlap", buf, 2u);
}

void sub_100143B70()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:storeURL is nil, aborting", v2, v3, v4, v5, v6);
}

void sub_100143BA4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Failed to create container, aborting", v2, v3, v4, v5, v6);
}

void sub_100143BD8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Failed to create queue", v2, v3, v4, v5, v6);
}

void sub_100143C0C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Failed to create database maintenance timer", v2, v3, v4, v5, v6);
}

void sub_100143C40()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100143C74()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Failed to update stored config, aborting", v2, v3, v4, v5, v6);
}

void sub_100143CA8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Container created, setting descriptions", v2, v3, v4, v5, v6);
}

void sub_100143CDC()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Loading data model from URL %@", v2);
}

void sub_100143D48()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Running database maintenance based on timer trigger", v2, v3, v4, v5, v6);
}

void sub_100143D7C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_100143DB0()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Successfully loaded CoreData store %@", v2);
}

void sub_100143E1C(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData]:Error while loading persistent store %@: %@", buf, 0x16u);
}

void sub_100143E84()
{
  sub_10001FDAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData]:No or invalid persistent store in coordinator, aborting (%@, %@)", v2, 0x16u);
}

void sub_100143F08()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Received request to clear database", v2, v3, v4, v5, v6);
}

void sub_100143F3C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData]:#D Attempting to clear persistent store (%@, %@)", (uint8_t *)&v4, 0x16u);
}

void sub_100143FC4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Cannot load stored config, context is nil", v2, v3, v4, v5, v6);
}

void sub_100143FF8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D No configuration in the database", v2, v3, v4, v5, v6);
}

void sub_10014402C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:values of Configuration are nil or of unexpected class", v2, v3, v4, v5, v6);
}

void sub_100144060()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching configuration: %@", v5);
}

void sub_1001440A4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Cannot update stored config, context is nil", v2, v3, v4, v5, v6);
}

void sub_1001440D8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving after removing Configurations: %@", v5);
}

void sub_10014411C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching Configurations to delete: %@", v5);
}

void sub_100144160()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error fetching number of Configurations: %@", v5);
}

void sub_1001441A4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving Configuration: %@", v5);
}

void sub_1001441E8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_100027360((void *)&_mh_execute_header, a2, a3, "FederatedMobility[FMCoreData]:#D New config: %@", (uint8_t *)&v4);
}

void sub_10014425C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving updated ServingCell: %@", v5);
}

void sub_1001442A0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving ServingCell: %@", v5);
}

void sub_1001442E4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Creating new ServingCell", v2, v3, v4, v5, v6);
}

void sub_100144318()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D No matching ServingCell found", v2, v3, v4, v5, v6);
}

void sub_10014434C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:More than one result for ServingCell", v2, v3, v4, v5, v6);
}

void sub_100144380()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching ServingCell: %@", v5);
}

void sub_1001443C4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:#D Fetching ServingCell with predicate %@", v5);
}

void sub_100144408()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching OutOfServiceAreas without nextVisit: %@", v5);
}

void sub_10014444C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Failed to retrieve OOS area by ID to update", v2, v3, v4, v5, v6);
}

void sub_100144480()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving updated OutOfServiceArea: %@", v5);
}

void sub_1001444C4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Newly created OOS area got deleted immediately", v2, v3, v4, v5, v6);
}

void sub_1001444F8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving OutOfServiceArea: %@", v5);
}

void sub_10014453C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D No matching OutOfServiceArea found after filtering", v2, v3, v4, v5, v6);
}

void sub_100144570()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D More than one filtered OutOfServiceArea result, choosing nearest", v2, v3, v4, v5, v6);
}

void sub_1001445A4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching OutOfServiceArea: %@", v5);
}

void sub_1001445E8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving LocationOfInterest: %@", v5);
}

void sub_10014462C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Creating new LocationOfInterest", v2, v3, v4, v5, v6);
}

void sub_100144660()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:#D No matching LocationOfInterest found for predicate %@", v5);
}

void sub_1001446A4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Closest LocationOfInterest is still too far away, returning nil", v2, v3, v4, v5, v6);
}

void sub_1001446D8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D More than one result for LocationOfInterest, choosing closest", v2, v3, v4, v5, v6);
}

void sub_10014470C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching location of interest: %@", v5);
}

void sub_100144750()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:#D Fetching LocationOfInterest with predicate %@", v5);
}

void sub_100144794()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Could not delete OOS areas", v2, v3, v4, v5, v6);
}

void sub_1001447C8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching OOS areas to delete: %@", v5);
}

void sub_10014480C()
{
  sub_10001FDAC();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData]:#D Number of OOS areas in database (%lu) is below or at threshold (%lu)", v2, 0x16u);
}

void sub_100144890()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error fetching number of OOS entities: %@", v5);
}

void sub_1001448D4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D No orphaned serving cells found", v2, v3, v4, v5, v6);
}

void sub_100144908()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving after removing orphaned serving cells: %@", v5);
}

void sub_10014494C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching orphaned serving cells: %@", v5);
}

void sub_100144990()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D No orphaned locations of interest found", v2, v3, v4, v5, v6);
}

void sub_1001449C4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving after removing orphaned locations of interest: %@", v5);
}

void sub_100144A08()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching orphaned locations of interest: %@", v5);
}

void sub_100144A4C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:#D Fetching OOS areas with predicate %@", v5);
}

void sub_100144A90()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving after removing OOS durations: %@", v5);
}

void sub_100144AD4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while fetching OOS durations to delete: %@", v5);
}

void sub_100144B18()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:#D Fetching OOS durations with predicate %@", v5);
}

void sub_100144B5C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:Cannot perform maintenance, context is nil", v2, v3, v4, v5, v6);
}

void sub_100144B90()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Database maintenance completed", v2, v3, v4, v5, v6);
}

void sub_100144BC4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Starting database maintenance", v2, v3, v4, v5, v6);
}

void sub_100144BF8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error fetching OOS area with highest seen count: %@", v5);
}

void sub_100144C3C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error fetching number of OOS Durations: %@", v5);
}

void sub_100144C80()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error fetching number of OOS Areas: %@", v5);
}

void sub_100144CC4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Could not create time zone", v2, v3, v4, v5, v6);
}

void sub_100144CF8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Could not create calendar", v2, v3, v4, v5, v6);
}

void sub_100144D2C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D Could not get components from date", v2, v3, v4, v5, v6);
}

void sub_100144D60()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData]:#D TimeOfDay is larger than INT16_MAX: %ld", v2);
}

void sub_100144DCC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData]:Error while saving after removing OOS areas: %@", v5);
}

void sub_100144E18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "TelephonyStateRelay:Received unexpected CT notification %@", (uint8_t *)&v2, 0xCu);
}

void sub_100144E90()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:Unable to allocate process name for airplane mode updates", v2, v3, v4, v5, v6);
}

void sub_100144EC4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:Unable to allocate preferences name for airplane mode updates", v2, v3, v4, v5, v6);
}

void sub_100144EF8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:Creating preferences for airplane mode updates failed", v2, v3, v4, v5, v6);
}

void sub_100144F2C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:Error while setting airplane mode change callback", v2, v3, v4, v5, v6);
}

void sub_100144F60()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:Error while setting dispatch queue for airplane mode change callback", v2, v3, v4, v5, v6);
}

void sub_100144F94()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:#D No information about satellite, skipping", v2, v3, v4, v5, v6);
}

void sub_100144FC8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:#D No satellite capability status", v2, v3, v4, v5, v6);
}

void sub_100144FFC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "TelephonyStateRelay:#D Capabilities changed for context %@: %@", v4, 0x16u);
}

void sub_100145054()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:#D Received radio state notification without information", v2, v3, v4, v5, v6);
}

void sub_100145088()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:#D Received radio state notification without state value", v2, v3, v4, v5, v6);
}

void sub_1001450BC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:#D Call active on other context, suppressing registration status change", v2, v3, v4, v5, v6);
}

void sub_1001450F0(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100027384((void *)&_mh_execute_header, a2, a3, "TelephonyStateRelay:Error while copying registration status: %@", (uint8_t *)a2);
}

void sub_10014513C(void *a1, void *a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "TelephonyStateRelay:#D Callback for context %@, testing call with localSenderIdentityUUID %@", v5, 0x16u);
}

void sub_10014519C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100027384((void *)&_mh_execute_header, a2, a3, "TelephonyStateRelay:Error while fetching airplane mode status after callback: %@", (uint8_t *)a2);
}

void sub_1001451E8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "TelephonyStateRelay:Subscriptions in use is null", v2, v3, v4, v5, v6);
}

void sub_10014521C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100027384((void *)&_mh_execute_header, a2, a3, "TelephonyStateRelay:Error while fetching subscriptions info: %@", (uint8_t *)a2);
}

void sub_100145268()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMOOSPredictor]:Cannot fetch predictions, context is nil", v1, 2u);
}

void sub_1001452A8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSPredictor]:#D Retrieving OOS recovery predictions", v2, v3, v4, v5, v6);
}

void sub_1001452DC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSPredictor]:#D No matching OutOfServiceArea found for recovery after filtering", v2, v3, v4, v5, v6);
}

void sub_100145310()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSPredictor]:#D More than one filtered OutOfServiceArea result, sorting for predictions", v2, v3, v4, v5, v6);
}

void sub_100145344(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMOOSPredictor]:Error while fetching OutOfServiceArea: %@", buf, 0xCu);
}

void sub_10014539C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSPredictor]:#D At least one prevCell, prevVisit, or curVisit not in DB, therefore no predictions available", v2, v3, v4, v5, v6);
}

void sub_1001453D0(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSPredictor]:#D a: %d, b: %d", buf, 0xEu);
}

void sub_100145428()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSPredictor]:#D Cannot create FMOOSRecoveryPrediction for OutOfServiceArea: No durations", v2, v3, v4, v5, v6);
}

void sub_10014545C(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSPredictor]:#D Sorting next cells using seen count: %{BOOL}d", (uint8_t *)v2, 8u);
}

void sub_1001454D8(void *a1, uint64_t a2)
{
  uint64_t v3 = __cxa_begin_catch(a1);
  uint64_t v4 = *(NSObject **)(a2 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (*(uint64_t (**)(void *))(*(void *)v3 + 16))(v3);
    int v6 = 136315138;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "conv:#E Runtime error when converting metric to XPC: %s", (uint8_t *)&v6, 0xCu);
  }
}

void sub_1001455A4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Failed to initialize parent", v2, v3, v4, v5, v6);
}

void sub_1001455D8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_10014560C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_100145640()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMOOSModel]:Failed to allocate state for context %@", v1, 0xCu);
}

void sub_1001456B4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSModel]:#D Initializing context %@", buf, 0xCu);
}

void sub_10014570C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSModel]:#D Updating context %@", buf, 0xCu);
}

void sub_100145764(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSModel]:#D Airplane mode status switched to %{BOOL}d", (uint8_t *)v2, 8u);
}

void sub_1001457E0()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Crowdsourced OOS learnings: cellCoverageTile not available", v2, v3, v4, v5, v6);
}

void sub_100145814()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Crowdsourced OOS learnings: OOS Rate per Tile is not valid", v2, v3, v4, v5, v6);
}

void sub_100145848()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:subs_id to send to baseband is larger than 1, aborting", v2, v3, v4, v5, v6);
}

void sub_10014587C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Unable to create insight container", v2, v3, v4, v5, v6);
}

void sub_1001458B0()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Unable to create insight configuration", v2, v3, v4, v5, v6);
}

void sub_1001458E4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Unable to get the InsightManager object", v2, v3, v4, v5, v6);
}

void sub_100145918()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Received display status change for unknown context %@", v2, v3, v4, v5, v6);
}

void sub_100145980()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Airplane mode active, ignoring OOS start", v2, v3, v4, v5, v6);
}

void sub_1001459B4()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D OOS area entry already set for context %@, keeping it", v2, v3, v4, v5, v6);
}

void sub_100145A1C()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D No oosAreaEntry found for context %@", v2, v3, v4, v5, v6);
}

void sub_100145A84()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Could not find suitable nextCell for context %@ after OOS exit", v2, v3, v4, v5, v6);
}

void sub_100145AEC()
{
  sub_10001FDAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSModel]:#D Received display status change for context %@: %@", v2, 0x16u);
}

void sub_100145B70()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Received nil cell monitor update for context %@", v2, v3, v4, v5, v6);
}

void sub_100145BD8()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Received cell monitor update for unknown context %@", v2, v3, v4, v5, v6);
}

void sub_100145C40()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Cell Monitor Update for context %@ failed, cell is null", v2, v3, v4, v5, v6);
}

void sub_100145CA8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D No retriggering prediction since cell did not meaningfully change", v2, v3, v4, v5, v6);
}

void sub_100145CDC(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSModel]:#D Failed to extract FMServingCell from cell info for context %@: %@", buf, 0x16u);
}

void sub_100145D44()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Could not derive predicted duration from list of durations, aborting", v2, v3, v4, v5, v6);
}

void sub_100145D78()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Not sending prediction since we're tracking an active OOS area", v2, v3, v4, v5, v6);
}

void sub_100145DAC()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Ignoring location update for context %@: Not OOS or on-device prediction sent", v2, v3, v4, v5, v6);
}

void sub_100145E14()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Visit started", v2, v3, v4, v5, v6);
}

void sub_100145E48()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:#D Visit ended", v2, v3, v4, v5, v6);
}

void sub_100145E7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100145EEC()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMOOSModel]:Last cell before OOS area is nil, aborting", v2, v3, v4, v5, v6);
}

void sub_100145F20()
{
  sub_10007DFD0();
  *(_DWORD *)uint64_t v1 = 136380675;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[WISToCAEventSanitizer] Failed to process array of strings: %{private}s", v3, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100145F84()
{
  sub_10007DFD0();
  *(_DWORD *)uint64_t v1 = 136380675;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[WISToCAEventSanitizer] Failed to process array of bytes: %{private}s", v3, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100145FE8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "WISToCAEventSanitizer::concatentateArrayOfBytes couldn't convert element to string", v0, 2u);
}

void sub_100146030()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Failed to initialize parent", v2, v3, v4, v5, v6);
}

void sub_100146064()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100146098()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_1001460CC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Received empty locations from didUpdateLocations", v2, v3, v4, v5, v6);
}

void sub_100146100()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Disable visit checking based on FM config", v2, v3, v4, v5, v6);
}

void sub_100146134()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Received visit without placeInference from didVisit", v2, v3, v4, v5, v6);
}

void sub_100146168()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreLocationController]:#D Received nil visit from didReportVisit, therefore no current visit", v2, v3, v4, v5, v6);
}

void sub_10014619C(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreLocationController]:CoreLocation encountered an error: %@ (code %ld)", buf, 0x16u);
}

uint64_t sub_100146204(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_10014623C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FederatedMobility[FMConfiguration]:Missing configuration value for key %@", (uint8_t *)&v2, 0xCu);
}

void sub_1001462B4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMConfiguration]:One or more errors while initializing FMConfiguration: %@. Aborting", buf, 0xCu);
}

void sub_10014630C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMConfiguration]:#D FedMobility Config: %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100146394(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FederatedMobility[FMConfiguration]:Key %@ missing in active config during compatibility check", (uint8_t *)&v2, 0xCu);
}

void sub_10014640C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "config:Illegal config!", v1, 2u);
}

void sub_100146450(__int16 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D Successfully stored new event of type %d", (uint8_t *)v2, 8u);
}

void sub_1001464CC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while saving TSEvent: %@", v5);
}

void sub_100146510()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeries]:Anomaly started before it ended, aborting", v2, v3, v4, v5, v6);
}

void sub_100146544(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D Successfully stored new TSAnomaly %@", (uint8_t *)&v2, 0xCu);
}

void sub_1001465BC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while saving TSAnomaly: %@", v5);
}

void sub_100146600(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+TimeSeries]:Event timestamp after anomaly timestamp, skipping", buf, 2u);
}

void sub_100146640(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+TimeSeries]:Failed to create TSEvent", buf, 2u);
}

void sub_100146680()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeries]:Prediction's end timestamp before the start timestamp, aborting", v2, v3, v4, v5, v6);
}

void sub_1001466B4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeries]:Prediction's start timestamp before the prediction timestamp, aborting", v2, v3, v4, v5, v6);
}

void sub_1001466E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D Successfully stored new TSPrediction %@", (uint8_t *)&v2, 0xCu);
}

void sub_100146760()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while saving TSPrediction: %@", v5);
}

void sub_1001467A4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeries]:Could not delete TSAnomalies", v2, v3, v4, v5, v6);
}

void sub_1001467D8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while fetching TSAnomalies to delete: %@", v5);
}

void sub_10014681C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D Number of TSAnomalies in database (%lu) is below or at threshold (%lu)", (uint8_t *)&v3, 0x16u);
}

void sub_1001468A4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error fetching number of TSAnomaly entities: %@", v5);
}

void sub_1001468E8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while saving after removing TSAnomaly: %@", v5);
}

void sub_10014692C()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D No orphaned TSPredictions found", v1, 2u);
}

void sub_10014696C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while saving after removing orphaned TSPredictions: %@", v5);
}

void sub_1001469B0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while fetching orphaned TSPredictions: %@", v5);
}

void sub_1001469F4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+TimeSeries]:Could not delete anomalies", v2, v3, v4, v5, v6);
}

void sub_100146A28()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+TimeSeries]:Error while fetching anomalies to delete: %@", v5);
}

void sub_100146A6C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D Fetching anomalies with predicate %@", v4, 0xCu);
}

void sub_100146ABC()
{
  sub_100099008();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "WISABC:#D Event %s has no ABC rule", v1, 0xCu);
}

void sub_100146B44()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "WISABC:Exception while getting needed metric fields for cellularVoiceLastCallEnd hence skipping ABC", v2);
}

void sub_100146B7C()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "WISABC:Exception while getting needed metric fields for cellularDynamicRatSelection hence skipping ABC", v2);
}

void sub_100146BB4()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "WISABC:Skipping ABC, unable to read rb_pdu_discard_perc_bin_index for event: cellularNrDlPdcpStats", v2);
}

void sub_100146BEC()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "WISABC:Skipping ABC, unable to read rb_is_srb for event: cellularNrDlPdcpStats", v2);
}

void sub_100146C24()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "WISABC:Skipping ABC, unable to read rb_pdu_discard_perc_bin_index for event: cellularNrUlPdcpStats", v2);
}

void sub_100146C5C()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "WISABC:Skipping ABC, unable to read rb_is_srb for event: cellularNrUlPdcpStats", v2);
}

void sub_100146C94()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D cellularSignalBars check for IMSCallSummaryStats has failed and hence skipping ABC", v2, v3, v4, v5, v6);
}

void sub_100146CC8(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080)) {
    sub_100099014((void *)&_mh_execute_header, v1, v2, "WISABC:Exception while checking for caseSubType in IMSCallSummaryStats hence skipping ABC", v3, v4, v5, v6, 0);
  }
}

void sub_100146D20()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D caseSubType checks for IMSCallSummaryStats has failed and hence skipping ABC", v2, v3, v4, v5, v6);
}

void sub_100146D54(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080)) {
    sub_100099014((void *)&_mh_execute_header, v1, v2, "WISABC:Exception while checking for cellularSignalBars in IMSCallSummaryStats hence skipping ABC", v3, v4, v5, v6, 0);
  }
  __cxa_end_catch();
}

void sub_100146DB0()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D cellularSignalBars check for IMSCallAudioFrameStats has failed and hence skipping ABC", v2, v3, v4, v5, v6);
}

void sub_100146DE4(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080)) {
    sub_100099014((void *)&_mh_execute_header, v1, v2, "WISABC:Exception while checking for caseSubType in IMSCallAudioFrameStats hence skipping ABC", v3, v4, v5, v6, 0);
  }
}

void sub_100146E3C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D caseSubType checks for IMSCallAudioFrameStats has failed and hence skipping ABC", v2, v3, v4, v5, v6);
}

void sub_100146E70(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080)) {
    sub_100099014((void *)&_mh_execute_header, v1, v2, "WISABC:Exception while checking for cellularSignalBars in IMSCallAudioFrameStats hence skipping ABC", v3, v4, v5, v6, 0);
  }
  __cxa_end_catch();
}

void sub_100146ECC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D cellularSignalBars check for IMSCallAudioDistortionSummary has failed and hence skipping ABC", v2, v3, v4, v5, v6);
}

void sub_100146F00(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080)) {
    sub_100099014((void *)&_mh_execute_header, v1, v2, "WISABC:Exception while checking for caseSubType in IMSCallAudioDistortionSummary hence skipping ABC", v3, v4, v5, v6, 0);
  }
}

void sub_100146F58()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D caseSubType checks for IMSCallAudioDistortionSummary has failed and hence skipping ABC", v2, v3, v4, v5, v6);
}

void sub_100146F8C(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080)) {
    sub_100099014((void *)&_mh_execute_header, v1, v2, "WISABC:Exception while checking for cellularSignalBars in IMSCallAudioDistortionSummary hence skipping ABC", v3, v4, v5, v6, 0);
  }
  __cxa_end_catch();
}

void sub_100146FE8()
{
  sub_100098FA0(__stack_chk_guard);
  sub_100099008();
  sub_100021DF4((void *)&_mh_execute_header, v0, v1, "WISABC:Skipping ABC, an exception while getting needed metric fields for %s", v2, v3, v4, v5, v6);
}

void sub_100147050(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100098FD4();
    sub_100099008();
    sub_100098FE8((void *)&_mh_execute_header, v1, v2, "WISABC:Skipping ABC, an exception while getting needed metric fields for %s", v3, v4, v5, v6, v7);
  }
  __cxa_end_catch();
}

void sub_1001470EC(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100098FD4();
    sub_100099008();
    sub_100098FE8((void *)&_mh_execute_header, v1, v2, "WISABC:Skipping ABC, an exception while getting needed metric fields for %s", v3, v4, v5, v6, v7);
  }
}

void sub_100147180(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100098FD4();
    sub_100099008();
    sub_100098FE8((void *)&_mh_execute_header, v1, v2, "WISABC:Skipping ABC, an exception while getting needed metric fields for %s", v3, v4, v5, v6, v7);
  }
}

void sub_100147214(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100098FD4();
    sub_100099008();
    sub_100098FE8((void *)&_mh_execute_header, v1, v2, "WISABC:Skipping ABC, an exception while getting needed metric fields for %s", v3, v4, v5, v6, v7);
  }
  __cxa_end_catch();
}

void sub_1001472B0(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100099064();
    uint64_t v1 = sub_100099098();
    v2(v1);
    sub_100099034();
    sub_100099078((void *)&_mh_execute_header, v3, v4, "WISABC:latency field not found in event: %s, using default value and proceeding, reason: %s", v5, v6, v7, v8, v9);
  }
}

void sub_100147370(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100098FD4();
    sub_100099008();
    sub_100098FE8((void *)&_mh_execute_header, v1, v2, "WISABC:Skipping ABC, unable to find if event %s is for RCS", v3, v4, v5, v6, v7);
  }
  __cxa_end_catch();
}

void sub_10014740C(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100099064();
    uint64_t v1 = sub_100099098();
    v2(v1);
    sub_100099034();
    sub_100099078((void *)&_mh_execute_header, v3, v4, "WISABC:sip_error_code field not found in event: %s, using default value and proceeding, reason: %s", v5, v6, v7, v8, v9);
  }
}

void sub_1001474CC(void *a1)
{
  __cxa_begin_catch(a1);
  if (sub_100098FB8(qword_1001D8080))
  {
    sub_100099064();
    uint64_t v1 = sub_100099098();
    v2(v1);
    sub_100099034();
    sub_100099078((void *)&_mh_execute_header, v3, v4, "WISABC:delay field not found in event: %s, using default value and proceeding, reason: %s", v5, v6, v7, v8, v9);
  }
}

uint64_t sub_10014758C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_1001475C4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMModel]:Failed to initialize parent", v2, v3, v4, v5, v6);
}

void sub_1001475F8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMModel]:Failed to initialize FMCoreTelephonyController", v2, v3, v4, v5, v6);
}

void sub_10014762C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMModel]:Failed to initialize FMRegulatoryDomainController", v2, v3, v4, v5, v6);
}

void sub_100147660()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMModel]:#D Initialized successfully", v1, 2u);
}

void sub_1001476A0()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMModel]:#D Deallocating", v1, 2u);
}

void sub_1001476E0(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMModel]:#D Removing state for %lu contexts, %lu subscriptions in use", buf, 0x16u);
}

void sub_100147738()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMModel]:initializeStateForContext illegally called on base class FMModel", v2, v3, v4, v5, v6);
}

void sub_10014776C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMModel]:updateStateForContext illegally called on base class FMModel", v2, v3, v4, v5, v6);
}

void sub_1001477A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147818(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147890(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147908(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147980(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001479F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147A70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147AE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147B60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147BD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147C50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147CC8(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "insight_config:#D config = %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100147D3C(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009E79C((void *)&_mh_execute_header, v2, v3, "insight_config:Crowdsourced OOS learnings: Count is not valid", v4);
}

void sub_100147D68(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009E79C((void *)&_mh_execute_header, v2, v3, "insight_config:Crowdsourced OOS learnings: RSRP is not valid", v4);
}

void sub_100147D94(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009E79C((void *)&_mh_execute_header, v2, v3, "insight_config:Crowdsourced OOS learnings: Band is not valid", v4);
}

void sub_100147DC0(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009E79C((void *)&_mh_execute_header, v2, v3, "insight_config:Crowdsourced OOS learnings: ARFCN is not valid", v4);
}

void sub_100147DEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void sub_100147E24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void sub_100147E5C(char *a1, void *a2, os_log_t log)
{
  if (*a1 >= 0) {
    os_log_t v3 = a2;
  }
  else {
    os_log_t v3 = (void *)*a2;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "submit:OSAMoveFileForSubmission failed for file '%s'!", (uint8_t *)&v4, 0xCu);
}

void sub_100147EE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100147F20(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "persist:Unable to create DB with error %d", (uint8_t *)v2, 8u);
}

void sub_100147F98(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "persist:#D Done executing DB command.", buf, 2u);
}

void sub_100147FD8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Insight config is null", v1, 2u);
}

void sub_10014801C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find an instance of the WISBasebandManager", v1, 2u);
}

uint64_t sub_100148060(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_100148098(uint64_t a1)
{
  sub_1000B9A40(a1);
  sub_1000AF834((void *)&_mh_execute_header, v1, v2, "rule:Equal-to metric rule creation failed due invalid type (type=%u)", v3, v4, v5, v6, 0);
}

void sub_100148114()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionArea]:#D Initialized FMCongestionArea %@", v2, v3, v4, v5, v6);
}

void sub_10014817C()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionArea]:#D Exited FMCongestionArea %@", v2, v3, v4, v5, v6);
}

void sub_1001481E4()
{
  sub_10001FDAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCongestionArea]:Unexpectedly invalidating congestion area based on bad cell addition: %@", v1, 0xCu);
}

void sub_100148258()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionArea]:#D Added bad cell to FMCongestionArea %@", v2, v3, v4, v5, v6);
}

void sub_1001482C0()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionArea]:#D Invalidating congestion area based on good cell addition: %@", v2, v3, v4, v5, v6);
}

void sub_100148328()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionArea]:#D Added good cell to FMCongestionArea %@", v2, v3, v4, v5, v6);
}

void sub_100148390()
{
  sub_10001FDAC();
  sub_100021DD8((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCongestionArea]:#D Finalized FMCongestionArea %@", v2, v3, v4, v5, v6);
}

void sub_1001483F8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:InsightContainer is null.", v2, v3, v4, v5, v6);
}

void sub_10014842C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:Failed to create the insights configuration.", v2, v3, v4, v5, v6);
}

void sub_100148460()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:Insight container is empty.", v2, v3, v4, v5, v6);
}

void sub_100148494()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:Failed to serialize the insights configuration.", v2, v3, v4, v5, v6);
}

void sub_1001484C8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility:Failed to initialize parent", v2, v3, v4, v5, v6);
}

void sub_1001484FC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100148530()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility:Failed to initialize FMConfiguration, aborting", v2, v3, v4, v5, v6);
}

void sub_100148564()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "FederatedMobility:Unable to initialize Core Data, aborting", v2, v3, v4, v5, v6);
}

void sub_100148598()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility:#D Successfully initialized Federated Mobility", v2, v3, v4, v5, v6);
}

void sub_1001485CC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility:#D Successfully initialized Federated Mobility time series predictions", v2, v3, v4, v5, v6);
}

void sub_100148600()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility:#D Successfully initialized FMCM", v2, v3, v4, v5, v6);
}

void sub_100148634()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility:#D Federated Mobility initialization fully complete", v2, v3, v4, v5, v6);
}

void sub_100148668()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_10014869C()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreRoutineController]:Failed to initialize parent", v1, 2u);
}

void sub_1001486DC()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreRoutineController]:Failed to register for RTLocationsOfInterestDidClearNotification", v1, 2u);
}

void sub_10014871C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreRoutineController]:#D Initialized successfully", v2, v3, v4, v5, v6);
}

void sub_100148750()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreRoutineController]:#D Locations of interest cleared", v2, v3, v4, v5, v6);
}

void sub_100148784()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreRoutineController]:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_1001487B8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "client:#D sendCollectionTraitsToAllClients_sync: # of registered components is = %zd", (uint8_t *)&v3, 0xCu);
}

void sub_100148834(uint64_t *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *a1;
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "client:#D Client mgr sending msg of type 0x%llx on connection %p", buf, 0x16u);
}

void sub_100148890(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "client:#D New connection for pid %d", (uint8_t *)v2, 8u);
}

void sub_100148908(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "client:#D In block for registering component 0x%x", (uint8_t *)v2, 8u);
}

void sub_100148980(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "client:#D In sendAllConfigurations_sync, # of registered components is %zd", (uint8_t *)&v3, 0xCu);
}

void sub_1001489FC()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "OOSRecoveryMetric:Subscriptions in use is null", v1, 2u);
}

void sub_100148A3C()
{
  sub_100027354();
  *uint64_t v1 = 138412290;
  *int v3 = v2;
  sub_100027360((void *)&_mh_execute_header, v5, (uint64_t)v3, "OOSRecoveryMetric:#D Initializing data for new context %@", v4);
}

void sub_100148A8C()
{
  sub_100027354();
  *uint64_t v1 = 138412290;
  *int v3 = v2;
  sub_100027360((void *)&_mh_execute_header, v5, (uint64_t)v3, "OOSRecoveryMetric:#D Skipping initialization for existing context %@", v4);
}

void sub_100148ADC(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_1000B9130((void *)&_mh_execute_header, "OOSRecoveryMetric:#D Removing state for %lu contexts, %lu subscriptions in use", (uint8_t *)a1, a4);
}

void sub_100148B28()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:Unable to fetch current data subscription context: %@", v5);
}

void sub_100148B6C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:Unable to fetch subscription info: %@", v5);
}

void sub_100148BB0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:Error while fetching registration display status: %@", v5);
}

void sub_100148BF4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:Cell info is null for context %@", v5);
}

void sub_100148C38()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Successfully received initial cell info for context %@", v5);
}

void sub_100148C7C()
{
  sub_1000B914C();
  sub_100036090(v2, v3, v4, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "OOSRecoveryMetric:Error while fetching cell info for context %@: %@", v5, 0x16u);
}

void sub_100148CD0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:Could not allocate state for context %@", v5);
}

void sub_100148D14(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, a2, a3, 5.778e-34);
  sub_1000B9130((void *)&_mh_execute_header, "OOSRecoveryMetric:#D Successfully initialized state for context %@: %@", v4, v5);
}

void sub_100148D60()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "OOSRecoveryMetric:#D Subscription info changed", v2, v3, v4, v5, v6);
}

void sub_100148D94()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:Received null display status for context %@", v5);
}

void sub_100148DD8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Received display status change callback for unknown context: %@", v5);
}

void sub_100148E1C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Received display status change callback for context %@, but display status did not change", v5);
}

void sub_100148E60()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Starting OOS tracking for context %@", v5);
}

void sub_100148EA4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Registration state for context %@ indicates in service, but cell info not up to date", v5);
}

void sub_100148EE8()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Sending OOS event for context %@", v5);
}

void sub_100148F2C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100036090((uint64_t)a1, a2, a3, 5.778e-34);
  sub_1000B9130((void *)&_mh_execute_header, "OOSRecoveryMetric:#D Display status of context %@ changed. New display status: %@", v4, v5);
}

void sub_100148F78()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Current data context changed to %@", v5);
}

void sub_100148FBC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Received cell monitor update for unknown context: %@", v5);
}

void sub_100149000()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "OOSRecoveryMetric:#D Received Cell Monitor update for context %@", v5);
}

void sub_100149044()
{
  sub_1000B914C();
  sub_100036090(v2, v3, v4, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "OOSRecoveryMetric:Could not extract cell information for context %@: %@", v5, 0x16u);
}

void sub_100149098(char a1, NSObject *a2, uint64_t a3)
{
  CFStringRef v3 = @"off";
  if (a1) {
    CFStringRef v3 = @"on";
  }
  int v4 = 138412290;
  CFStringRef v5 = v3;
  sub_100027360((void *)&_mh_execute_header, a2, a3, "OOSRecoveryMetric:#D Airplane mode status switched to %@", (uint8_t *)&v4);
}

void sub_100149120()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "OOSRecoveryMetric:#D Received callback for airplane mode, but its value did not change", v2, v3, v4, v5, v6);
}

void sub_100149154()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "OOSRecoveryMetric:#D Suppressing event since cellInfo or oosStart.cellInfo is default or start is before current time", v2, v3, v4, v5, v6);
}

void sub_100149188(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100027360((void *)&_mh_execute_header, a2, a3, "OOSRecoveryMetric:#D Sent CA event for state %@", (uint8_t *)&v3);
}

void sub_1001491F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "config:#D Registered for notification callback.", v1, 2u);
}

void sub_10014923C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:xpc message was NULL.", v2, v3, v4, v5, v6);
}

void sub_100149270()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:xpc connection was NULL.", v2, v3, v4, v5, v6);
}

void sub_1001492A4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:Observe had no reply; skipping.", v2, v3, v4, v5, v6);
}

void sub_1001492D8()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:SubmitterController::getInstance returned NULL when trying to process ConsolidateDeviceDiagnostics control message.", v2, v3, v4, v5, v6);
}

void sub_10014930C()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:ConsolidateDeviceDiagnostics had no reply; skipping.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100149340()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:ConsolidateDeviceDiagnostics has unknown diagType; skipping.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100149374()
{
  sub_10001FDB8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "conn:#D Flush complete.", v1, 2u);
}

void sub_1001493B4()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "conn:TriggerTimerEventsNow had no reply; skipping.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1001493E8(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "conn:CoreAnalytics shim: Filesytem error on metadata directory! Looking for component 0x%x", (uint8_t *)v3, 8u);
}

void sub_100149464(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "conn:CoreAnalytics shim: Metadata already loaded for 0x%x", (uint8_t *)v2, 8u);
}

void sub_1001494DC(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "conn:#D Sending observation for metric: %s.", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100149550(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "WISABC:#D CTProperty: %@ is enabled", (uint8_t *)&v2, 0xCu);
}

void sub_1001495C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "WISABC:#D CTProperty: %@ is disabled", (uint8_t *)&v2, 0xCu);
}

void sub_100149640()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D ABC case dict is built and will be submitted now", v2, v3, v4, v5, v6);
}

void sub_100149674()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D Not setting CellularDE parameter and will default to Symptoms side default config(if any) for this case", v2, v3, v4, v5, v6);
}

void sub_1001496A8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D Feedback is not enabled in seed hence skipping triggering ABC", v2, v3, v4, v5, v6);
}

void sub_1001496DC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D CoreDumps are not enabled and hence skipping triggering ABC", v2, v3, v4, v5, v6);
}

void sub_100149710()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "WISABC:#D Baseband traces are not enabled for Cellular case domain and hence skipping triggering ABC", v2, v3, v4, v5, v6);
}

void sub_100149744(_DWORD *a1, NSObject *a2)
{
  int v2 = a1[22];
  int v3 = a1[23];
  int v4 = a1[24];
  v5[0] = 67109632;
  v5[1] = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "trig:#D handleWisdTrigger: AWD component Trigger(cid=0x%x, trid=0x%x, sid=%u) completed", (uint8_t *)v5, 0x14u);
}

void sub_1001497D8(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 60);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "trig:#D handleWisdTrigger: Calling callback on metric: 0x%x", (uint8_t *)v3, 8u);
}

void sub_100149854()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:Failed to create the insights pointer.", v2, v3, v4, v5, v6);
}

void sub_100149888()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:SendInsightsNow has no reply; skipping.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1001498BC()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:SendMockCellInfo has no reply; skipping.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1001498F0()
{
  sub_10001FDB8();
  sub_1000273A0((void *)&_mh_execute_header, v0, v1, "insight_config:GetConfigurationForLocation has no reply; skipping.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100149924()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "submit.proc:#D Skipping trigger-condition evaluation; none required.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100149958()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "submit.proc:#D Skipping should-process evaluation; trivially true.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10014998C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "submit.proc:#D Skipping should-save evaluation; trivially true.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1001499C0()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "submit.proc:#D Skipping metric-processing; none required.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1001499F4(void *a1, uint64_t a2, void *a3)
{
  __cxa_begin_catch(a1);
  uint64_t v4 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (v4) {
    sub_10000B678(v4);
  }
}

void sub_100149A28(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#D No build update; build is %{public}s",
    (uint8_t *)&v2,
    0xCu);
}

void sub_100149AA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100149AD8(uint64_t a1)
{
}

void sub_100149AF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100149B2C()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "RatRetentionMetric:TelephonyStateRelay coreTelephonyClient is nil", v1, 2u);
}

void sub_100149B6C()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Received deployment type for LTE serving cell: %@", v2);
}

void sub_100149BD8()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "RatRetentionMetric:Subscriptions in use is null", v1, 2u);
}

void sub_100149C18()
{
  sub_100027354();
  *uint64_t v1 = 138412290;
  *uint64_t v3 = v2;
  sub_100027360((void *)&_mh_execute_header, v5, (uint64_t)v3, "RatRetentionMetric:#D Initializing data for new context %@", v4);
}

void sub_100149C68()
{
  sub_100027354();
  *uint64_t v1 = 138412290;
  *uint64_t v3 = v2;
  sub_100027360((void *)&_mh_execute_header, v5, (uint64_t)v3, "RatRetentionMetric:#D Skipping initialization for existing context %@", v4);
}

void sub_100149CB8(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_1000B9130((void *)&_mh_execute_header, "RatRetentionMetric:#D Removing state for %lu contexts, %lu subscriptions in use", (uint8_t *)a1, a4);
}

void sub_100149D04()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Unable to fetch current data subscription context: %@", v5);
}

void sub_100149D48()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Unable to fetch subscription info: %@", v5);
}

void sub_100149D8C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Not submitting CA event because current time is before start time", v2, v3, v4, v5, v6);
}

void sub_100149DC0()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Not submitting CA event because duration is shorter than threshold: %llu", v2);
}

void sub_100149E2C()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Emergency satellite state changed to %@", v2);
}

void sub_100149E98()
{
  sub_10001FDAC();
  sub_100027360((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Radio state changed to %@", v2);
}

void sub_100149F04(char a1, NSObject *a2, uint64_t a3)
{
  CFStringRef v3 = @"OFF";
  if (a1) {
    CFStringRef v3 = @"ON";
  }
  int v4 = 138412290;
  CFStringRef v5 = v3;
  sub_100027360((void *)&_mh_execute_header, a2, a3, "RatRetentionMetric:#D Airplane mode status changed to %@", (uint8_t *)&v4);
}

void sub_100149F8C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Received airplane mode change callback, but airplane mode status did not change", v2, v3, v4, v5, v6);
}

void sub_100149FC0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Current data context changed to %@", v5);
}

void sub_10014A004()
{
  sub_100027354();
  sub_1000EF924(v1, v2, v3, 1.5047e-36);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "RatRetentionMetric:Could not retrieve new data bearer technology string for enum value %d for context %@", v4, 0x12u);
}

void sub_10014A058()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received data status change callback for unknown context: %@", v5);
}

void sub_10014A09C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received data status change callback for context %@, but data bearer technology and data connection type did not change", v5);
}

void sub_10014A0E0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received cell monitor update for unknown context: %@", v5);
}

void sub_10014A124()
{
  sub_1000EF914();
  sub_100036090(v1, v2, v3, 5.778e-34);
  sub_1000B9130((void *)&_mh_execute_header, "RatRetentionMetric:#D Cell monitor update result for context %@: %@", v4, v5);
}

void sub_10014A168()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Cell monitor for context %@ updated but values did not change", v5);
}

void sub_10014A1AC()
{
  sub_1000B914C();
  *(_DWORD *)uint64_t v2 = 138412547;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2113;
  *(void *)(v2 + 14) = v4;
  sub_1000B9130((void *)&_mh_execute_header, "RatRetentionMetric:#D Cell monitor update result for context %@: lastKnownGci %{private}@", v5, v6);
}

void sub_10014A204()
{
  sub_1000B914C();
  sub_100036090(v2, v3, v4, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "RatRetentionMetric:Could not extract cell information for context %@: %@", v5, 0x16u);
}

void sub_10014A258()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received Cell Monitor update for context %@", v5);
}

void sub_10014A29C()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Received null display status for context %@", v5);
}

void sub_10014A2E0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received display status change callback for unknown context: %@", v5);
}

void sub_10014A324()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received display status change callback for context %@, but display status did not change", v5);
}

void sub_10014A368()
{
  sub_1000EF914();
  sub_100036090(v1, v2, v3, 5.778e-34);
  sub_1000B9130((void *)&_mh_execute_header, "RatRetentionMetric:#D Display status of context %@ changed. New display status: %@", v4, v5);
}

void sub_10014A3AC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Subscription info changed", v2, v3, v4, v5, v6);
}

void sub_10014A3E0()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received satellite status change callback for unknown context: %@", v5);
}

void sub_10014A424()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received satellite status change callback for context %@, but status did not change", v5);
}

void sub_10014A468()
{
  sub_1000EF914();
  *(_DWORD *)uint64_t v2 = 138412546;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "RatRetentionMetric:#D Satellite status of context %@ changed to %{BOOL}d", v4, 0x12u);
}

void sub_10014A4CC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received satellite provisioning status change callback for unknown context: %@", v5);
}

void sub_10014A510()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Received satellite provisioning status change callback for context %@, but status did not change", v5);
}

void sub_10014A554()
{
  sub_1000EF914();
  sub_100036090(v1, v2, v3, 5.778e-34);
  sub_1000B9130((void *)&_mh_execute_header, "RatRetentionMetric:#D Satellite provisioning status of context %@ changed to %@", v4, v5);
}

void sub_10014A598()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Error while fetching data status: %@", v5);
}

void sub_10014A5DC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Error while fetching registration display status: %@", v5);
}

void sub_10014A620()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Cell info is null for context %@", v5);
}

void sub_10014A664()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:#D Successfully received initial cell info for context %@", v5);
}

void sub_10014A6A8()
{
  sub_1000B914C();
  sub_100036090(v2, v3, v4, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "RatRetentionMetric:Error while fetching cell info for context %@: %@", v5, 0x16u);
}

void sub_10014A6FC()
{
  sub_100027354();
  sub_1000EF924(v1, v2, v3, 1.5047e-36);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "RatRetentionMetric:Could not retrieve data bearer technology string for enum value %d for context %@", v4, 0x12u);
}

void sub_10014A750()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "RatRetentionMetric:Could not allocate state for context %@", v5);
}

void sub_10014A794()
{
  sub_1000EF914();
  sub_100036090(v1, v2, v3, 5.778e-34);
  sub_1000B9130((void *)&_mh_execute_header, "RatRetentionMetric:#D Successfully initialized state for context %@: %@", v4, v5);
}

void sub_10014A7D8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "RatRetentionMetric:#D Unable to allocate NSString, returning default", v2, v3, v4, v5, v6);
}

void sub_10014A80C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "PowerUsageMetric:#D Event duration too long, ignoring", v2, v3, v4, v5, v6);
}

void sub_10014A840(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PowerUsageMetric:Failed to convert incoming metric: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10014A8B8(void *a1, char a2, os_log_t log)
{
  uint64_t v3 = (void *)*a1;
  if ((a2 & 1) == 0) {
    uint64_t v3 = a1;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PowerUsageMetric:#D Received event %s", (uint8_t *)&v4, 0xCu);
}

void sub_10014A940()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "PowerUsageMetric:#D Initialized power usage metric", v2, v3, v4, v5, v6);
}

void sub_10014A974()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "PowerUsageMetric:Failed to register for charging state notification, aborting", v1, 2u);
}

void sub_10014A9B4()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "PowerUsageMetric:#D Received notification for charging state", v2, v3, v4, v5, v6);
}

void sub_10014A9E8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "PowerUsageMetric:#D Deallocating", v2, v3, v4, v5, v6);
}

void sub_10014AA1C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "PowerUsageMetric:#D Submitting event payload: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10014AA94()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "PowerUsageMetric:#D Not initialized, yet", v2, v3, v4, v5, v6);
}

void sub_10014AAC8()
{
  sub_10001FDB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "PowerUsageMetric:Failed to retrieve service", v1, 2u);
}

void sub_10014AB08(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PowerUsageMetric:Retrieved property is null or of unexpected class (%@, %@)", buf, 0x16u);
}

void sub_10014AB70()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving updated CongestionCell: %@", v5);
}

void sub_10014ABB4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving CongestionCell: %@", v5);
}

void sub_10014ABF8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Creating new CongestionCell", v2, v3, v4, v5, v6);
}

void sub_10014AC2C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D No matching CongestionCell found", v2, v3, v4, v5, v6);
}

void sub_10014AC60(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009904C((void *)&_mh_execute_header, v2, (uint64_t)v2, "FederatedMobility[FMCoreData+Congestion]:Retrieved CongestionCell that's neither a good nor a bad cell; should not happen",
    v3);
}

void sub_10014AC90()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching CongestionCell: %@", v5);
}

void sub_10014ACD4()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:#D Fetching CongestionCells with predicate %@", v5);
}

void sub_10014AD18()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving updated CongestionPrevCell: %@", v5);
}

void sub_10014AD5C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Creating new CongestionPrevCell", v2, v3, v4, v5, v6);
}

void sub_10014AD90()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D No matching CongestionPrevCell found", v2, v3, v4, v5, v6);
}

void sub_10014ADC4()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:More than one result for CongestionPrevCell", v2);
}

void sub_10014ADFC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching CongestionPrevCell: %@", v5);
}

void sub_10014AE40()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:#D Fetching CongestionPrevCell with predicate %@", v5);
}

void sub_10014AE84()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:Failed to retrieve congestion area by ID to update", v2);
}

void sub_10014AEBC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving updated CongestionArea: %@", v5);
}

void sub_10014AF00(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009904C((void *)&_mh_execute_header, v2, (uint64_t)v2, "FederatedMobility[FMCoreData+Congestion]:Received bad cell without congestion metric, this should not happen. Ignoring cell", v3);
}

void sub_10014AF30(unsigned char *a1, unsigned char *a2)
{
  sub_10009E78C(a1, a2);
  sub_10009904C((void *)&_mh_execute_header, v2, (uint64_t)v2, "FederatedMobility[FMCoreData+Congestion]:Received good cell without congestion metric, this should not happen. Ignoring cell", v3);
}

void sub_10014AF60()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Newly created congestion area got deleted immediately", v2, v3, v4, v5, v6);
}

void sub_10014AF94()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving CongestionArea: %@", v5);
}

void sub_10014AFD8()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D No matching CongestionArea found after filtering", v2, v3, v4, v5, v6);
}

void sub_10014B00C()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D More than one filtered CongestionArea result, choosing nearest", v2, v3, v4, v5, v6);
}

void sub_10014B040()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching CongestionArea: %@", v5);
}

void sub_10014B084()
{
  sub_10001FDB8();
  sub_10009904C((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:Could not delete congestion areas", v2);
}

void sub_10014B0BC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching congestion areas to delete: %@", v5);
}

void sub_10014B100()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:#D Fetching congestion areas with predicate %@", v5);
}

void sub_10014B144()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving after removing congestion occurrences: %@", v5);
}

void sub_10014B188()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching congestion occurrences to delete: %@", v5);
}

void sub_10014B1CC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100036074((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:#D Fetching congestion occurrences with predicate %@", v5);
}

void sub_10014B210(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+Congestion]:#D Number of congestion areas in database (%lu) is below or at threshold (%lu)", (uint8_t *)&v3, 0x16u);
}

void sub_10014B298()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error fetching number of CongestionArea entities: %@", v5);
}

void sub_10014B2DC()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving after removing congestion areas: %@", v5);
}

void sub_10014B320()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D No orphaned congestion cells found", v2, v3, v4, v5, v6);
}

void sub_10014B354()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving after removing orphaned congestion cells: %@", v5);
}

void sub_10014B398()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching orphaned congestion cells: %@", v5);
}

void sub_10014B3DC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D No orphaned congestion prev cells found", v2, v3, v4, v5, v6);
}

void sub_10014B410()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while saving after removing orphaned congestion prev cells: %@", v5);
}

void sub_10014B454()
{
  sub_100027354();
  sub_100027378(v1, v2, 5.7779e-34);
  sub_100027384((void *)&_mh_execute_header, v3, v4, "FederatedMobility[FMCoreData+Congestion]:Error while fetching orphaned congestion prev cells: %@", v5);
}

void sub_10014B498()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Could not create time zone", v2, v3, v4, v5, v6);
}

void sub_10014B4CC()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Could not create calendar", v2, v3, v4, v5, v6);
}

void sub_10014B500()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Could not get time zone", v2, v3, v4, v5, v6);
}

void sub_10014B534()
{
  sub_10001FDB8();
  sub_10001FD90((void *)&_mh_execute_header, v0, v1, "FederatedMobility[FMCoreData+Congestion]:#D Could not get components from date", v2, v3, v4, v5, v6);
}

void sub_10014B568(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+Congestion]:#D DayOfWeek is larger than INT16_MAX: %ld", (uint8_t *)&v2, 0xCu);
}

void sub_10014B5E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to load ManagedConfiguration framework", v1, 2u);
}

void sub_10014B624(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to get the MCProfileConnection class definition", v1, 2u);
}

void sub_10014B668(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#D Notified of effective settings changed, SafetyDataSubmissionAllowed = %{BOOL}d", (uint8_t *)v2, 8u);
}

void sub_10014B6EC()
{
  sub_100031540(__stack_chk_guard);
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = v0;
  sub_100031558((void *)&_mh_execute_header, v1, v2, "cahandler:Unknown CA event: %s", v3);
}

void sub_10014B758()
{
  sub_100031540(__stack_chk_guard);
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = v0;
  sub_100031558((void *)&_mh_execute_header, v1, v2, "cahandler:Failed to open the write log for speed event, %s", v3);
}

void sub_10014B7C4(os_log_t log)
{
  int v1 = 136315138;
  os_log_t v2 = "CellularDataDiagnosticsSuite";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "cahandler:#D Speed is called by: %s", (uint8_t *)&v1, 0xCu);
}

void sub_10014B848(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "cahandler:AppleCare logs filepath not found and bailing out write operation", v1, 2u);
}

void sub_10014B88C(void *a1)
{
  __cxa_begin_catch(a1);
  int v1 = *(NSObject **)(qword_1001D8080 + 112);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)os_log_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "cahandler:Failed to parse event data to json", v2, 2u);
  }
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t WIS.XPC.ServicePredictionRequest.name.getter()
{
  return WIS.XPC.ServicePredictionRequest.name.getter();
}

uint64_t type metadata accessor for WIS.XPC.ServicePredictionRequest()
{
  return type metadata accessor for WIS.XPC.ServicePredictionRequest();
}

uint64_t WIS.XPC.ServicePredictionResponse.init(predictions:)()
{
  return WIS.XPC.ServicePredictionResponse.init(predictions:)();
}

uint64_t type metadata accessor for WIS.XPC.ServicePredictionResponse()
{
  return type metadata accessor for WIS.XPC.ServicePredictionResponse();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static XPCListener.InitializationOptions.none.getter()
{
  return static XPCListener.InitializationOptions.none.getter();
}

uint64_t type metadata accessor for XPCListener.InitializationOptions()
{
  return type metadata accessor for XPCListener.InitializationOptions();
}

uint64_t XPCListener.IncomingSessionRequest.withUnsafeAuditToken<A>(_:)()
{
  return XPCListener.IncomingSessionRequest.withUnsafeAuditToken<A>(_:)();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)()
{
  return dispatch thunk of XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.reject(reason:)()
{
  return dispatch thunk of XPCListener.IncomingSessionRequest.reject(reason:)();
}

uint64_t XPCListener.init(service:targetQueue:options:incomingSessionHandler:)()
{
  return XPCListener.init(service:targetQueue:options:incomingSessionHandler:)();
}

uint64_t type metadata accessor for XPCListener()
{
  return type metadata accessor for XPCListener();
}

uint64_t XPCReceivedMessage.decode<A>(as:)()
{
  return XPCReceivedMessage.decode<A>(as:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazyWithOptions()
{
  return _AnalyticsSendEventLazyWithOptions();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return _CFURLCreateDataAndPropertiesFromResource(alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTimeInterval IOPSGetTimeRemainingEstimate(void)
{
  return _IOPSGetTimeRemainingEstimate();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t OSAInMultiUserMode()
{
  return _OSAInMultiUserMode();
}

uint64_t OSAMoveFileForSubmissions()
{
  return _OSAMoveFileForSubmissions();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TelephonyRadiosGetRadio()
{
  return _TelephonyRadiosGetRadio();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return _TelephonyRadiosGetRadioVendor();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyTraceProperty()
{
  return __CTServerConnectionCopyTraceProperty();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionGetRadioState()
{
  return __CTServerConnectionGetRadioState();
}

uint64_t _CTServerConnectionRegisterBlockForNotification()
{
  return __CTServerConnectionRegisterBlockForNotification();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return __CTServerConnectionUnregisterForAllNotifications();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t sMetricNamesResolver()
{
  return sMetricNamesResolver();
}

uint64_t sMetricToXpcTransform()
{
  return sMetricToXpcTransform();
}

uint64_t sCreateBestChoiceMetadataLoaderDelegate(void)
{
  return sCreateBestChoiceMetadataLoaderDelegate();
}

uint64_t sCreateWISMetadataLoaderForXpcConversion(void)
{
  return sCreateWISMetadataLoaderForXpcConversion();
}

uint64_t capabilities::abs::supportsBasebandInsights(capabilities::abs *this)
{
  return capabilities::abs::supportsBasebandInsights(this);
}

uint64_t WISMetadataLoader::WISMetadataLoader()
{
  return WISMetadataLoader::WISMetadataLoader();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, const void *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream(a1, a2);
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream(this, a2, a3);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString()
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, void *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, a2);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *a1, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream(a1, a2);
}

void wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
}

void wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, int a2, int a3, const char *a4)
{
  return wireless_diagnostics::google::protobuf::internal::VerifyVersion(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unsigned int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, BOOL a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(this, a2, a3, a4);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  return wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  return wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete()
{
  return wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete();
}

uint64_t MetricFileMetadataHelper::MetricFileMetadataHelper()
{
  return MetricFileMetadataHelper::MetricFileMetadataHelper();
}

{
  return MetricFileMetadataHelper::MetricFileMetadataHelper();
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return PB::TextFormatter::beginObject(this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return PB::TextFormatter::format();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, BOOL a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, uint64_t a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, unint64_t a3)
{
  return PB::TextFormatter::format(this, a2, a3);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Reader::read()
{
  return PB::Reader::read();
}

uint64_t PB::Reader::skip(PB::Reader *this, unsigned int a2, unsigned __int8 a3, int a4)
{
  return PB::Reader::skip(this, a2, a3, a4);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this, uint64_t a2, unsigned int a3)
{
  return PB::Writer::writeVarInt(this, a2, a3);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this, unint64_t a2, unsigned int a3)
{
  return PB::Writer::writeVarInt(this, a2, a3);
}

uint64_t PB::Writer::write()
{
  return PB::Writer::write();
}

uint64_t PB::Writer::write(PB::Writer *this, BOOL a2, unsigned int a3)
{
  return PB::Writer::write(this, a2, a3);
}

uint64_t abm::client::CreateManager()
{
  return abm::client::CreateManager();
}

uint64_t abm::client::PerformCommand()
{
  return abm::client::PerformCommand();
}

uint64_t abm::client::GetBasebandBootState()
{
  return abm::client::GetBasebandBootState();
}

uint64_t abm::client::RegisterEventHandler()
{
  return abm::client::RegisterEventHandler();
}

uint64_t abm::client::EventsOn()
{
  return abm::client::EventsOn();
}

uint64_t abm::client::EventsOff()
{
  return abm::client::EventsOff();
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return ctu::OsLogLogger::OsLogLogger();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return ctu::OsLogLogger::OsLogLogger(this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return ctu::OsLogLogger::OsLogLogger(this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::path_join_impl()
{
  return ctu::path_join_impl();
}

{
  return ctu::path_join_impl();
}

uint64_t ctu::DispatchTimerService::create()
{
  return ctu::DispatchTimerService::create();
}

uint64_t ctu::cf::convert_copy()
{
  return ctu::cf::convert_copy();
}

uint64_t ctu::cf::assign()
{
  return ctu::cf::assign();
}

{
  return ctu::cf::assign();
}

{
  return ctu::cf::assign();
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return ctu::cf::assign(this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return ctu::cf::assign(this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return ctu::cf::assign(this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, uint64_t *a2, const __CFNumber *a3)
{
  return ctu::cf::assign(this, a2, a3);
}

uint64_t ctu::hex(ctu *this, unsigned int a2)
{
  return ctu::hex(this, a2);
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return ctu::Clock::now_in_nanoseconds(this);
}

uint64_t ctu::XpcServer::setListener_sync()
{
  return ctu::XpcServer::setListener_sync();
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return ctu::XpcServer::startListener_sync(this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return ctu::XpcServer::XpcServer();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return ctu::cf_to_xpc(this, a2);
}

uint64_t wis::GetProtobufTag()
{
  return wis::GetProtobufTag();
}

uint64_t wis::getWISTimestamp(wis *this)
{
  return wis::getWISTimestamp(this);
}

uint64_t wis::serializeMetric(wis *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, unsigned int a3)
{
  return wis::serializeMetric(this, a2, a3);
}

uint64_t wis::serializeMetric(wis *this, const PB::Base *a2, unsigned int a3)
{
  return wis::serializeMetric(this, a2, a3);
}

uint64_t wis::timevalToTimestamp(wis *this, timeval *a2)
{
  return wis::timevalToTimestamp(this, a2);
}

uint64_t wis::createTagForProtobuf(wis *this, unsigned int a2, unint64_t a3)
{
  return wis::createTagForProtobuf(this, a2, a3);
}

uint64_t wis::reflect::getDecodingType()
{
  return wis::reflect::getDecodingType();
}

uint64_t wis::reflect::getUnpackedType()
{
  return wis::reflect::getUnpackedType();
}

uint64_t wis::reflect::getWireTypeForType()
{
  return wis::reflect::getWireTypeForType();
}

uint64_t wis::reflect::decodeTag(wis::reflect *this, unsigned int a2)
{
  return wis::reflect::decodeTag(this, a2);
}

uint64_t wis::reflect::encodeTag()
{
  return wis::reflect::encodeTag();
}

uint64_t wis::asString()
{
  return wis::asString();
}

{
  return wis::asString();
}

uint64_t wis::asString(wis *this, unsigned int a2)
{
  return wis::asString(this, a2);
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)1>::encode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)1>::encode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)2>::encode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)2>::encode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)5>::encode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)5>::encode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode();
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)8>::encode()
{
  return wis::protobuf::NumberConverter<(wis::reflect::Type)8>::encode();
}

uint64_t xpc::dyn_cast_or_default()
{
  return xpc::dyn_cast_or_default();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, BOOL a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, int a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, unsigned int a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, unint64_t a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return xpc::bridge(this, (const xpc::object *)a2);
}

uint64_t MetadataHelper::getBuiltinType()
{
  return MetadataHelper::getBuiltinType();
}

uint64_t MetadataHelper::getField()
{
  return MetadataHelper::getField();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2)
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(wireless_diagnostics::google::protobuf::MessageLite *this)
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString()
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
}

uint64_t MetricFileMetadataHelper::getSubfield()
{
  return MetricFileMetadataHelper::getSubfield();
}

uint64_t MetricFileMetadataHelper::getSubfieldType()
{
  return MetricFileMetadataHelper::getSubfieldType();
}

uint64_t MetricFileMetadataHelper::isTopLevelField()
{
  return MetricFileMetadataHelper::isTopLevelField();
}

uint64_t ctu::TimerService::throwIfPeriodIsZero()
{
  return ctu::TimerService::throwIfPeriodIsZero();
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return xpc::object::to_string(this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return std::error_code::message(retstr, this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return std::string::compare(this, __s);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return std::__fs::filesystem::directory_iterator::__dereference(this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__extension(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__root_directory(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return std::__fs::filesystem::path::__compare(this, a2);
}

BOOL std::locale::has_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::has_facet(this, a2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

{
  return std::logic_error::logic_error(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
}

{
  std::logic_error::~logic_error(this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  std::runtime_error::~runtime_error(this);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
}

{
  std::invalid_argument::~invalid_argument(this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return std::__get_sp_mut(a1);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::append(this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::assign(this, __n, __c);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return std::string::insert(this, __pos, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return std::string::replace(this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return std::string::operator=(this, __c);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

{
  return std::istream::~istream();
}

uint64_t std::istream::operator>>()
{
  return std::istream::operator>>();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

void std::error_category::~error_category(std::error_category *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

const std::error_category *std::generic_category(void)
{
  return std::generic_category();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

BOOL std::__fs::filesystem::__copy_file(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::__fs::filesystem::copy_options __opt, std::error_code *__ec)
{
  return std::__fs::filesystem::__copy_file(__from, __to, __opt, __ec);
}

BOOL std::__fs::filesystem::__create_directory(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return std::__fs::filesystem::__create_directory(a1, a2);
}

void std::__fs::filesystem::__create_hard_link(const std::__fs::filesystem::path *__to, const std::__fs::filesystem::path *__new_hard_link, std::error_code *__ec)
{
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return std::__fs::filesystem::directory_iterator::__increment(this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return std::__fs::filesystem::directory_iterator::directory_iterator(this, a2, a3, a4);
}

BOOL std::__fs::filesystem::__remove(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__remove(a1, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__status(a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return std::chrono::system_clock::from_time_t(__t);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return std::locale::operator=(this, a2);
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

void std::exception::~exception(std::exception *this)
{
}

int std::uncaught_exceptions(void)
{
  return std::uncaught_exceptions();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy_with_options()
{
  return _analytics_send_event_lazy_with_options();
}

uint64_t analytics_send_event_with_options()
{
  return _analytics_send_event_with_options();
}

uint64_t analytics_send_exploding_event_lazy()
{
  return _analytics_send_exploding_event_lazy();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

long double cos(long double __x)
{
  return _cos(__x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

long double erf(long double __x)
{
  return _erf(__x);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

utmpx *getutxent(void)
{
  return _getutxent();
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  lldiv_t v4 = _lldiv(a1, a2);
  uint64_t rem = v4.rem;
  uint64_t quot = v4.quot;
  result.uint64_t rem = rem;
  result.uint64_t quot = quot;
  return result;
}

lconv *localeconv(void)
{
  return _localeconv();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

long double log10(long double __x)
{
  return _log10(__x);
}

float log10f(float a1)
{
  return _log10f(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

long double nextafter(long double __x, long double __y)
{
  return _nextafter(__x, __y);
}

float nextafterf(float a1, float a2)
{
  return _nextafterf(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return _nw_interface_get_index(interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return _nw_interface_get_type(interface);
}

uint64_t nw_path_copy_interface()
{
  return _nw_path_copy_interface();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

uint64_t nw_path_get_interface_index()
{
  return _nw_path_get_interface_index();
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

void nw_release(void *obj)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t pathconf(const char *a1, int a2)
{
  return _pathconf(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return _sqlite3_backup_finish(p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return _sqlite3_backup_init(pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return _sqlite3_backup_step(p, nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return _wmemchr(__s, __c, __n);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_shmem_create_readonly()
{
  return _xpc_shmem_create_readonly();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_CellCoverageTileMinNumberOfObservations(void *a1, const char *a2, ...)
{
  return [a1 CellCoverageTileMinNumberOfObservations];
}

id objc_msgSend_CrowdsourcedMaxCountDiffPercentThreshold(void *a1, const char *a2, ...)
{
  return [a1 CrowdsourcedMaxCountDiffPercentThreshold];
}

id objc_msgSend_CrowdsourcedMinDistanceChangedWhileOOSThreshold(void *a1, const char *a2, ...)
{
  return [a1 CrowdsourcedMinDistanceChangedWhileOOSThreshold];
}

id objc_msgSend_CrowdsourcedOOSRateDiffThreshold(void *a1, const char *a2, ...)
{
  return [a1 CrowdsourcedOOSRateDiffThreshold];
}

id objc_msgSend_FMTSAnomaliesInDatabase(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomaliesInDatabase];
}

id objc_msgSend_FMTSAnomalyBaseConfidence(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyBaseConfidence];
}

id objc_msgSend_FMTSAnomalyConfidenceMinPredictionCount(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyConfidenceMinPredictionCount];
}

id objc_msgSend_FMTSAnomalyPredictionAdvanceTimeSeconds(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyPredictionAdvanceTimeSeconds];
}

id objc_msgSend_FMTSAnomalyPredictionDurationConfidenceRangeSeconds(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyPredictionDurationConfidenceRangeSeconds];
}

id objc_msgSend_FMTSAnomalyPredictionMinNumObservedEvents(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyPredictionMinNumObservedEvents];
}

id objc_msgSend_FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds];
}

id objc_msgSend_FMTSAnomalyStoringMinNumObservedEvents(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyStoringMinNumObservedEvents];
}

id objc_msgSend_FMTSAnomalyUsedForPredictionDistanceThreshold(void *a1, const char *a2, ...)
{
  return [a1 FMTSAnomalyUsedForPredictionDistanceThreshold];
}

id objc_msgSend_FMTSCellChangeCrossDistance(void *a1, const char *a2, ...)
{
  return [a1 FMTSCellChangeCrossDistance];
}

id objc_msgSend_FMTSEnableTimeSeriesPredictions(void *a1, const char *a2, ...)
{
  return [a1 FMTSEnableTimeSeriesPredictions];
}

id objc_msgSend_FMTSEventTypeWeightCellChange(void *a1, const char *a2, ...)
{
  return [a1 FMTSEventTypeWeightCellChange];
}

id objc_msgSend_FMTSEventTypeWeightSignalStrengthChange(void *a1, const char *a2, ...)
{
  return [a1 FMTSEventTypeWeightSignalStrengthChange];
}

id objc_msgSend_FMTSEventTypeWeightVisitEnd(void *a1, const char *a2, ...)
{
  return [a1 FMTSEventTypeWeightVisitEnd];
}

id objc_msgSend_FMTSEventTypeWeightVisitStart(void *a1, const char *a2, ...)
{
  return [a1 FMTSEventTypeWeightVisitStart];
}

id objc_msgSend_FMTSPredictionMinTimeBetweenPredictionsSeconds(void *a1, const char *a2, ...)
{
  return [a1 FMTSPredictionMinTimeBetweenPredictionsSeconds];
}

id objc_msgSend_FMTSSignalStrengthChangeSameDirectionDistance(void *a1, const char *a2, ...)
{
  return [a1 FMTSSignalStrengthChangeSameDirectionDistance];
}

id objc_msgSend_FMTSTimeDistanceMaxTime(void *a1, const char *a2, ...)
{
  return [a1 FMTSTimeDistanceMaxTime];
}

id objc_msgSend_FMTSTimeDistanceWeight(void *a1, const char *a2, ...)
{
  return [a1 FMTSTimeDistanceWeight];
}

id objc_msgSend_FMTSWindowSizeInDatabaseSeconds(void *a1, const char *a2, ...)
{
  return [a1 FMTSWindowSizeInDatabaseSeconds];
}

id objc_msgSend_FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds(void *a1, const char *a2, ...)
{
  return [a1 FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds];
}

id objc_msgSend_LocationHorizontalAccuracyThreshold(void *a1, const char *a2, ...)
{
  return [a1 LocationHorizontalAccuracyThreshold];
}

id objc_msgSend_OOSAreasDatabaseTimeToLive(void *a1, const char *a2, ...)
{
  return [a1 OOSAreasDatabaseTimeToLive];
}

id objc_msgSend_OOSDurationsInDatabase(void *a1, const char *a2, ...)
{
  return [a1 OOSDurationsInDatabase];
}

id objc_msgSend_OOSMaxOOSAreasInDatabase(void *a1, const char *a2, ...)
{
  return [a1 OOSMaxOOSAreasInDatabase];
}

id objc_msgSend_OOSMaxSecondsSinceCellSeenBeforeInService(void *a1, const char *a2, ...)
{
  return [a1 OOSMaxSecondsSinceCellSeenBeforeInService];
}

id objc_msgSend_OOSMinOOSAreaDurationSeconds(void *a1, const char *a2, ...)
{
  return [a1 OOSMinOOSAreaDurationSeconds];
}

id objc_msgSend_OOSMinSeenCountForSendingPrediction(void *a1, const char *a2, ...)
{
  return [a1 OOSMinSeenCountForSendingPrediction];
}

id objc_msgSend_OOSNextVisitCutoffMinutes(void *a1, const char *a2, ...)
{
  return [a1 OOSNextVisitCutoffMinutes];
}

id objc_msgSend_OOSPrevCellsInDatabase(void *a1, const char *a2, ...)
{
  return [a1 OOSPrevCellsInDatabase];
}

id objc_msgSend_OOSPrevCellsInMemory(void *a1, const char *a2, ...)
{
  return [a1 OOSPrevCellsInMemory];
}

id objc_msgSend_OOSTimeBetweenDatabaseMaintenance(void *a1, const char *a2, ...)
{
  return [a1 OOSTimeBetweenDatabaseMaintenance];
}

id objc_msgSend_OOSTimeOfDayWindowBackMinutes(void *a1, const char *a2, ...)
{
  return [a1 OOSTimeOfDayWindowBackMinutes];
}

id objc_msgSend_OOSTimeOfDayWindowForwardMinutes(void *a1, const char *a2, ...)
{
  return [a1 OOSTimeOfDayWindowForwardMinutes];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__initSyncGroup(void *a1, const char *a2, ...)
{
  return [a1 _initSyncGroup];
}

id objc_msgSend__placeInference(void *a1, const char *a2, ...)
{
  return [a1 _placeInference];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__requestVisitState(void *a1, const char *a2, ...)
{
  return [a1 _requestVisitState];
}

id objc_msgSend__startLeechingVisits(void *a1, const char *a2, ...)
{
  return [a1 _startLeechingVisits];
}

id objc_msgSend_accuracy(void *a1, const char *a2, ...)
{
  return [a1 accuracy];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activatedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 activatedTimestamp];
}

id objc_msgSend_activeAnomalies(void *a1, const char *a2, ...)
{
  return [a1 activeAnomalies];
}

id objc_msgSend_activeCongestionAreas(void *a1, const char *a2, ...)
{
  return [a1 activeCongestionAreas];
}

id objc_msgSend_activePredictions(void *a1, const char *a2, ...)
{
  return [a1 activePredictions];
}

id objc_msgSend_actualBadCells(void *a1, const char *a2, ...)
{
  return [a1 actualBadCells];
}

id objc_msgSend_actualDuration(void *a1, const char *a2, ...)
{
  return [a1 actualDuration];
}

id objc_msgSend_actualEndTimestamp(void *a1, const char *a2, ...)
{
  return [a1 actualEndTimestamp];
}

id objc_msgSend_actualGoodCells(void *a1, const char *a2, ...)
{
  return [a1 actualGoodCells];
}

id objc_msgSend_actualStartTimestamp(void *a1, const char *a2, ...)
{
  return [a1 actualStartTimestamp];
}

id objc_msgSend_actualTimeInCongestion(void *a1, const char *a2, ...)
{
  return [a1 actualTimeInCongestion];
}

id objc_msgSend_actualTimeUntilAnomaly(void *a1, const char *a2, ...)
{
  return [a1 actualTimeUntilAnomaly];
}

id objc_msgSend_actualTimeUntilCongestion(void *a1, const char *a2, ...)
{
  return [a1 actualTimeUntilCongestion];
}

id objc_msgSend_airplaneModeActive(void *a1, const char *a2, ...)
{
  return [a1 airplaneModeActive];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anomaly(void *a1, const char *a2, ...)
{
  return [a1 anomaly];
}

id objc_msgSend_arfcn(void *a1, const char *a2, ...)
{
  return [a1 arfcn];
}

id objc_msgSend_arfcnOrUarfcn(void *a1, const char *a2, ...)
{
  return [a1 arfcnOrUarfcn];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrivalDate(void *a1, const char *a2, ...)
{
  return [a1 arrivalDate];
}

id objc_msgSend_authorizationManager(void *a1, const char *a2, ...)
{
  return [a1 authorizationManager];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_averageEventDistance(void *a1, const char *a2, ...)
{
  return [a1 averageEventDistance];
}

id objc_msgSend_badCellOf(void *a1, const char *a2, ...)
{
  return [a1 badCellOf];
}

id objc_msgSend_badCells(void *a1, const char *a2, ...)
{
  return [a1 badCells];
}

id objc_msgSend_band(void *a1, const char *a2, ...)
{
  return [a1 band];
}

id objc_msgSend_bandInfo(void *a1, const char *a2, ...)
{
  return [a1 bandInfo];
}

id objc_msgSend_bandwidth(void *a1, const char *a2, ...)
{
  return [a1 bandwidth];
}

id objc_msgSend_bars(void *a1, const char *a2, ...)
{
  return [a1 bars];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return [a1 batteryLevel];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callOnLocationFailedCallback(void *a1, const char *a2, ...)
{
  return [a1 callOnLocationFailedCallback];
}

id objc_msgSend_cellChanges(void *a1, const char *a2, ...)
{
  return [a1 cellChanges];
}

id objc_msgSend_cellID(void *a1, const char *a2, ...)
{
  return [a1 cellID];
}

id objc_msgSend_cellInfo(void *a1, const char *a2, ...)
{
  return [a1 cellInfo];
}

id objc_msgSend_cells(void *a1, const char *a2, ...)
{
  return [a1 cells];
}

id objc_msgSend_cellularProdExpQueue(void *a1, const char *a2, ...)
{
  return [a1 cellularProdExpQueue];
}

id objc_msgSend_cellularRegistrationState(void *a1, const char *a2, ...)
{
  return [a1 cellularRegistrationState];
}

id objc_msgSend_clearDatabase(void *a1, const char *a2, ...)
{
  return [a1 clearDatabase];
}

id objc_msgSend_clientPrediction(void *a1, const char *a2, ...)
{
  return [a1 clientPrediction];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_confidenceAnomaly(void *a1, const char *a2, ...)
{
  return [a1 confidenceAnomaly];
}

id objc_msgSend_confidenceDuration(void *a1, const char *a2, ...)
{
  return [a1 confidenceDuration];
}

id objc_msgSend_confidenceTimeUntilAnomaly(void *a1, const char *a2, ...)
{
  return [a1 confidenceTimeUntilAnomaly];
}

id objc_msgSend_configAsDict(void *a1, const char *a2, ...)
{
  return [a1 configAsDict];
}

id objc_msgSend_congestionGoodCellsInDatabase(void *a1, const char *a2, ...)
{
  return [a1 congestionGoodCellsInDatabase];
}

id objc_msgSend_congestionMaxAreasInDatabase(void *a1, const char *a2, ...)
{
  return [a1 congestionMaxAreasInDatabase];
}

id objc_msgSend_congestionMetric(void *a1, const char *a2, ...)
{
  return [a1 congestionMetric];
}

id objc_msgSend_congestionOccurrences(void *a1, const char *a2, ...)
{
  return [a1 congestionOccurrences];
}

id objc_msgSend_congestionOccurrencesInDatabase(void *a1, const char *a2, ...)
{
  return [a1 congestionOccurrencesInDatabase];
}

id objc_msgSend_congestionPredictionEnabledCountries(void *a1, const char *a2, ...)
{
  return [a1 congestionPredictionEnabledCountries];
}

id objc_msgSend_congestionPredictions(void *a1, const char *a2, ...)
{
  return [a1 congestionPredictions];
}

id objc_msgSend_congestionPrevCellsInDatabase(void *a1, const char *a2, ...)
{
  return [a1 congestionPrevCellsInDatabase];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_contextStates(void *a1, const char *a2, ...)
{
  return [a1 contextStates];
}

id objc_msgSend_contextUUID(void *a1, const char *a2, ...)
{
  return [a1 contextUUID];
}

id objc_msgSend_contextUUIDToStateMap(void *a1, const char *a2, ...)
{
  return [a1 contextUUIDToStateMap];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreLocationDistanceFilter(void *a1, const char *a2, ...)
{
  return [a1 coreLocationDistanceFilter];
}

id objc_msgSend_coreTelephonyClient(void *a1, const char *a2, ...)
{
  return [a1 coreTelephonyClient];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_crowdsourcedDisabledCountries(void *a1, const char *a2, ...)
{
  return [a1 crowdsourcedDisabledCountries];
}

id objc_msgSend_ctRelay(void *a1, const char *a2, ...)
{
  return [a1 ctRelay];
}

id objc_msgSend_curLocation(void *a1, const char *a2, ...)
{
  return [a1 curLocation];
}

id objc_msgSend_curRegistrationState(void *a1, const char *a2, ...)
{
  return [a1 curRegistrationState];
}

id objc_msgSend_curSignalStrengthBars(void *a1, const char *a2, ...)
{
  return [a1 curSignalStrengthBars];
}

id objc_msgSend_curState(void *a1, const char *a2, ...)
{
  return [a1 curState];
}

id objc_msgSend_curVisit(void *a1, const char *a2, ...)
{
  return [a1 curVisit];
}

id objc_msgSend_curVisitOf(void *a1, const char *a2, ...)
{
  return [a1 curVisitOf];
}

id objc_msgSend_currentEstimates(void *a1, const char *a2, ...)
{
  return [a1 currentEstimates];
}

id objc_msgSend_dataBearerTechnology(void *a1, const char *a2, ...)
{
  return [a1 dataBearerTechnology];
}

id objc_msgSend_dataConnectionType(void *a1, const char *a2, ...)
{
  return [a1 dataConnectionType];
}

id objc_msgSend_dataContext(void *a1, const char *a2, ...)
{
  return [a1 dataContext];
}

id objc_msgSend_dataInitializationSuccessful(void *a1, const char *a2, ...)
{
  return [a1 dataInitializationSuccessful];
}

id objc_msgSend_dataPreferred(void *a1, const char *a2, ...)
{
  return [a1 dataPreferred];
}

id objc_msgSend_dataStallIndicatorAVS(void *a1, const char *a2, ...)
{
  return [a1 dataStallIndicatorAVS];
}

id objc_msgSend_dataStallIndicatorUL(void *a1, const char *a2, ...)
{
  return [a1 dataStallIndicatorUL];
}

id objc_msgSend_databaseMaintenanceTimer(void *a1, const char *a2, ...)
{
  return [a1 databaseMaintenanceTimer];
}

id objc_msgSend_dayOfWeek(void *a1, const char *a2, ...)
{
  return [a1 dayOfWeek];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_departureDate(void *a1, const char *a2, ...)
{
  return [a1 departureDate];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_deploymentType(void *a1, const char *a2, ...)
{
  return [a1 deploymentType];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return [a1 details];
}

id objc_msgSend_detailsAsDict(void *a1, const char *a2, ...)
{
  return [a1 detailsAsDict];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didAnomalyHappen(void *a1, const char *a2, ...)
{
  return [a1 didAnomalyHappen];
}

id objc_msgSend_disableCrowdsourcedLearnings(void *a1, const char *a2, ...)
{
  return [a1 disableCrowdsourcedLearnings];
}

id objc_msgSend_disableVisitChecking(void *a1, const char *a2, ...)
{
  return [a1 disableVisitChecking];
}

id objc_msgSend_displayInactiveSOSInStatusBar(void *a1, const char *a2, ...)
{
  return [a1 displayInactiveSOSInStatusBar];
}

id objc_msgSend_displayStatus(void *a1, const char *a2, ...)
{
  return [a1 displayStatus];
}

id objc_msgSend_displayStewieInStatusBar(void *a1, const char *a2, ...)
{
  return [a1 displayStewieInStatusBar];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_dlBottleneckScoreAsString(void *a1, const char *a2, ...)
{
  return [a1 dlBottleneckScoreAsString];
}

id objc_msgSend_dlBottleneckScoreHigh(void *a1, const char *a2, ...)
{
  return [a1 dlBottleneckScoreHigh];
}

id objc_msgSend_dlBottleneckScoreInvalid(void *a1, const char *a2, ...)
{
  return [a1 dlBottleneckScoreInvalid];
}

id objc_msgSend_dlBottleneckScoreLow(void *a1, const char *a2, ...)
{
  return [a1 dlBottleneckScoreLow];
}

id objc_msgSend_dlBottleneckScoreMedium(void *a1, const char *a2, ...)
{
  return [a1 dlBottleneckScoreMedium];
}

id objc_msgSend_dlBottleneckScoreNo(void *a1, const char *a2, ...)
{
  return [a1 dlBottleneckScoreNo];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_durations(void *a1, const char *a2, ...)
{
  return [a1 durations];
}

id objc_msgSend_enableCongestionPredictions(void *a1, const char *a2, ...)
{
  return [a1 enableCongestionPredictions];
}

id objc_msgSend_enableFedMobilityOOSLearnings(void *a1, const char *a2, ...)
{
  return [a1 enableFedMobilityOOSLearnings];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endTimestamp(void *a1, const char *a2, ...)
{
  return [a1 endTimestamp];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_entryAccuracy(void *a1, const char *a2, ...)
{
  return [a1 entryAccuracy];
}

id objc_msgSend_entryLocation(void *a1, const char *a2, ...)
{
  return [a1 entryLocation];
}

id objc_msgSend_eventObserver(void *a1, const char *a2, ...)
{
  return [a1 eventObserver];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_eventsLastChangedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 eventsLastChangedTimestamp];
}

id objc_msgSend_exitAccuracy(void *a1, const char *a2, ...)
{
  return [a1 exitAccuracy];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_fetchInterfaceCounters(void *a1, const char *a2, ...)
{
  return [a1 fetchInterfaceCounters];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return [a1 finalize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fmCongestionModel(void *a1, const char *a2, ...)
{
  return [a1 fmCongestionModel];
}

id objc_msgSend_fmCoreData(void *a1, const char *a2, ...)
{
  return [a1 fmCoreData];
}

id objc_msgSend_fmCoreTelephonyController(void *a1, const char *a2, ...)
{
  return [a1 fmCoreTelephonyController];
}

id objc_msgSend_fmModel(void *a1, const char *a2, ...)
{
  return [a1 fmModel];
}

id objc_msgSend_fmOosModel(void *a1, const char *a2, ...)
{
  return [a1 fmOosModel];
}

id objc_msgSend_fmRegulatoryDomainController(void *a1, const char *a2, ...)
{
  return [a1 fmRegulatoryDomainController];
}

id objc_msgSend_fmTimeSeriesModel(void *a1, const char *a2, ...)
{
  return [a1 fmTimeSeriesModel];
}

id objc_msgSend_frequencyRange(void *a1, const char *a2, ...)
{
  return [a1 frequencyRange];
}

id objc_msgSend_fromBars(void *a1, const char *a2, ...)
{
  return [a1 fromBars];
}

id objc_msgSend_fromCellGCI(void *a1, const char *a2, ...)
{
  return [a1 fromCellGCI];
}

id objc_msgSend_gci(void *a1, const char *a2, ...)
{
  return [a1 gci];
}

id objc_msgSend_getCurrentEstimates(void *a1, const char *a2, ...)
{
  return [a1 getCurrentEstimates];
}

id objc_msgSend_getLatestStoredConfiguration(void *a1, const char *a2, ...)
{
  return [a1 getLatestStoredConfiguration];
}

id objc_msgSend_getNewBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 getNewBackgroundContext];
}

id objc_msgSend_getSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 getSharedInstance];
}

id objc_msgSend_getStewieState(void *a1, const char *a2, ...)
{
  return [a1 getStewieState];
}

id objc_msgSend_getSubscriptionContextsInUse(void *a1, const char *a2, ...)
{
  return [a1 getSubscriptionContextsInUse];
}

id objc_msgSend_getTelephonyClientInstance(void *a1, const char *a2, ...)
{
  return [a1 getTelephonyClientInstance];
}

id objc_msgSend_goodCellOf(void *a1, const char *a2, ...)
{
  return [a1 goodCellOf];
}

id objc_msgSend_goodCells(void *a1, const char *a2, ...)
{
  return [a1 goodCells];
}

id objc_msgSend_handleChargingStateUpdate(void *a1, const char *a2, ...)
{
  return [a1 handleChargingStateUpdate];
}

id objc_msgSend_handleSignificantLocationsCleared(void *a1, const char *a2, ...)
{
  return [a1 handleSignificantLocationsCleared];
}

id objc_msgSend_hasEnded(void *a1, const char *a2, ...)
{
  return [a1 hasEnded];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_homePLMN(void *a1, const char *a2, ...)
{
  return [a1 homePLMN];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_improveSafetyAllowed(void *a1, const char *a2, ...)
{
  return [a1 improveSafetyAllowed];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_indicator(void *a1, const char *a2, ...)
{
  return [a1 indicator];
}

id objc_msgSend_indicatorOverride(void *a1, const char *a2, ...)
{
  return [a1 indicatorOverride];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAirplaneModeActive(void *a1, const char *a2, ...)
{
  return [a1 isAirplaneModeActive];
}

id objc_msgSend_isCellularInterfaceExpensive(void *a1, const char *a2, ...)
{
  return [a1 isCellularInterfaceExpensive];
}

id objc_msgSend_isCellularLowDataModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCellularLowDataModeEnabled];
}

id objc_msgSend_isCongested(void *a1, const char *a2, ...)
{
  return [a1 isCongested];
}

id objc_msgSend_isCongestionPredictionEnabledInCurrentCountry(void *a1, const char *a2, ...)
{
  return [a1 isCongestionPredictionEnabledInCurrentCountry];
}

id objc_msgSend_isContextMapInitialized(void *a1, const char *a2, ...)
{
  return [a1 isContextMapInitialized];
}

id objc_msgSend_isCountersSet(void *a1, const char *a2, ...)
{
  return [a1 isCountersSet];
}

id objc_msgSend_isCurrentlyCharging(void *a1, const char *a2, ...)
{
  return [a1 isCurrentlyCharging];
}

id objc_msgSend_isDataContext(void *a1, const char *a2, ...)
{
  return [a1 isDataContext];
}

id objc_msgSend_isDataInitSuccess(void *a1, const char *a2, ...)
{
  return [a1 isDataInitSuccess];
}

id objc_msgSend_isFedMobilityPredictionEventSubmitted(void *a1, const char *a2, ...)
{
  return [a1 isFedMobilityPredictionEventSubmitted];
}

id objc_msgSend_isInCrowdsourcedDisabledCountry(void *a1, const char *a2, ...)
{
  return [a1 isInCrowdsourcedDisabledCountry];
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return [a1 isInitialized];
}

id objc_msgSend_isLocationAuthorized(void *a1, const char *a2, ...)
{
  return [a1 isLocationAuthorized];
}

id objc_msgSend_isMultiSim(void *a1, const char *a2, ...)
{
  return [a1 isMultiSim];
}

id objc_msgSend_isSafetyDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isSafetyDataSubmissionAllowed];
}

id objc_msgSend_isSatelliteProvisioned(void *a1, const char *a2, ...)
{
  return [a1 isSatelliteProvisioned];
}

id objc_msgSend_isSatelliteSystem(void *a1, const char *a2, ...)
{
  return [a1 isSatelliteSystem];
}

id objc_msgSend_isSent(void *a1, const char *a2, ...)
{
  return [a1 isSent];
}

id objc_msgSend_isStewieActive(void *a1, const char *a2, ...)
{
  return [a1 isStewieActive];
}

id objc_msgSend_isSubway(void *a1, const char *a2, ...)
{
  return [a1 isSubway];
}

id objc_msgSend_knownOosGcis(void *a1, const char *a2, ...)
{
  return [a1 knownOosGcis];
}

id objc_msgSend_knownOosGcisSizeLimited(void *a1, const char *a2, ...)
{
  return [a1 knownOosGcisSizeLimited];
}

id objc_msgSend_knownOosTacs(void *a1, const char *a2, ...)
{
  return [a1 knownOosTacs];
}

id objc_msgSend_knownOosTacsSizeLimited(void *a1, const char *a2, ...)
{
  return [a1 knownOosTacsSizeLimited];
}

id objc_msgSend_lastKnownGci(void *a1, const char *a2, ...)
{
  return [a1 lastKnownGci];
}

id objc_msgSend_lastMaxPercent(void *a1, const char *a2, ...)
{
  return [a1 lastMaxPercent];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastOosRate(void *a1, const char *a2, ...)
{
  return [a1 lastOosRate];
}

id objc_msgSend_lastPackCurrentAccumulator(void *a1, const char *a2, ...)
{
  return [a1 lastPackCurrentAccumulator];
}

id objc_msgSend_lastPackCurrentAccumulatorCount(void *a1, const char *a2, ...)
{
  return [a1 lastPackCurrentAccumulatorCount];
}

id objc_msgSend_lastPredictionsTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastPredictionsTimestamp];
}

id objc_msgSend_lastRawMaxCharge(void *a1, const char *a2, ...)
{
  return [a1 lastRawMaxCharge];
}

id objc_msgSend_lastRawRemainingCharge(void *a1, const char *a2, ...)
{
  return [a1 lastRawRemainingCharge];
}

id objc_msgSend_lastRemainingPercent(void *a1, const char *a2, ...)
{
  return [a1 lastRemainingPercent];
}

id objc_msgSend_lastSeen(void *a1, const char *a2, ...)
{
  return [a1 lastSeen];
}

id objc_msgSend_lastSubmissionTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastSubmissionTimestamp];
}

id objc_msgSend_lastVoltage(void *a1, const char *a2, ...)
{
  return [a1 lastVoltage];
}

id objc_msgSend_lat(void *a1, const char *a2, ...)
{
  return [a1 lat];
}

id objc_msgSend_latLng(void *a1, const char *a2, ...)
{
  return [a1 latLng];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_legacyInfo(void *a1, const char *a2, ...)
{
  return [a1 legacyInfo];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lng(void *a1, const char *a2, ...)
{
  return [a1 lng];
}

id objc_msgSend_localSenderIdentityUUID(void *a1, const char *a2, ...)
{
  return [a1 localSenderIdentityUUID];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationAllowed(void *a1, const char *a2, ...)
{
  return [a1 locationAllowed];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_maxCount(void *a1, const char *a2, ...)
{
  return [a1 maxCount];
}

id objc_msgSend_maxOosRate(void *a1, const char *a2, ...)
{
  return [a1 maxOosRate];
}

id objc_msgSend_mcc(void *a1, const char *a2, ...)
{
  return [a1 mcc];
}

id objc_msgSend_metadataType(void *a1, const char *a2, ...)
{
  return [a1 metadataType];
}

id objc_msgSend_minOosRate(void *a1, const char *a2, ...)
{
  return [a1 minOosRate];
}

id objc_msgSend_minPredictedDurationSeconds(void *a1, const char *a2, ...)
{
  return [a1 minPredictedDurationSeconds];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mnc(void *a1, const char *a2, ...)
{
  return [a1 mnc];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkPathMonitor(void *a1, const char *a2, ...)
{
  return [a1 networkPathMonitor];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_nextCellOf(void *a1, const char *a2, ...)
{
  return [a1 nextCellOf];
}

id objc_msgSend_nextCells(void *a1, const char *a2, ...)
{
  return [a1 nextCells];
}

id objc_msgSend_nextVisitOf(void *a1, const char *a2, ...)
{
  return [a1 nextVisitOf];
}

id objc_msgSend_notificationToken(void *a1, const char *a2, ...)
{
  return [a1 notificationToken];
}

id objc_msgSend_notifyClient(void *a1, const char *a2, ...)
{
  return [a1 notifyClient];
}

id objc_msgSend_notifyRegisteredClientsForExperimentEnd(void *a1, const char *a2, ...)
{
  return [a1 notifyRegisteredClientsForExperimentEnd];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nrnsaArfcn(void *a1, const char *a2, ...)
{
  return [a1 nrnsaArfcn];
}

id objc_msgSend_nrnsaBandwidth(void *a1, const char *a2, ...)
{
  return [a1 nrnsaBandwidth];
}

id objc_msgSend_nrnsaFrequencyRange(void *a1, const char *a2, ...)
{
  return [a1 nrnsaFrequencyRange];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numPrevPredictionCorrect(void *a1, const char *a2, ...)
{
  return [a1 numPrevPredictionCorrect];
}

id objc_msgSend_numPrevPredictions(void *a1, const char *a2, ...)
{
  return [a1 numPrevPredictions];
}

id objc_msgSend_numPrevTimesUntilAnomaly(void *a1, const char *a2, ...)
{
  return [a1 numPrevTimesUntilAnomaly];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_onDeviceDurationPredictionPercentile(void *a1, const char *a2, ...)
{
  return [a1 onDeviceDurationPredictionPercentile];
}

id objc_msgSend_oosAreaEntry(void *a1, const char *a2, ...)
{
  return [a1 oosAreaEntry];
}

id objc_msgSend_oosAreaSeenCount(void *a1, const char *a2, ...)
{
  return [a1 oosAreaSeenCount];
}

id objc_msgSend_oosStart(void *a1, const char *a2, ...)
{
  return [a1 oosStart];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pci(void *a1, const char *a2, ...)
{
  return [a1 pci];
}

id objc_msgSend_performDatabaseMaintenance(void *a1, const char *a2, ...)
{
  return [a1 performDatabaseMaintenance];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return [a1 placemark];
}

id objc_msgSend_plmn(void *a1, const char *a2, ...)
{
  return [a1 plmn];
}

id objc_msgSend_populateActiveDataContextInfo(void *a1, const char *a2, ...)
{
  return [a1 populateActiveDataContextInfo];
}

id objc_msgSend_populateSubscriptionContextsInUse(void *a1, const char *a2, ...)
{
  return [a1 populateSubscriptionContextsInUse];
}

id objc_msgSend_predictedAnomalyType(void *a1, const char *a2, ...)
{
  return [a1 predictedAnomalyType];
}

id objc_msgSend_predictedBadCells(void *a1, const char *a2, ...)
{
  return [a1 predictedBadCells];
}

id objc_msgSend_predictedDuration(void *a1, const char *a2, ...)
{
  return [a1 predictedDuration];
}

id objc_msgSend_predictedGoodCells(void *a1, const char *a2, ...)
{
  return [a1 predictedGoodCells];
}

id objc_msgSend_predictedOOSDuration(void *a1, const char *a2, ...)
{
  return [a1 predictedOOSDuration];
}

id objc_msgSend_predictedRecoveryCell(void *a1, const char *a2, ...)
{
  return [a1 predictedRecoveryCell];
}

id objc_msgSend_predictedStartTimestamp(void *a1, const char *a2, ...)
{
  return [a1 predictedStartTimestamp];
}

id objc_msgSend_predictedTimeInCongestion(void *a1, const char *a2, ...)
{
  return [a1 predictedTimeInCongestion];
}

id objc_msgSend_predictedTimeUntilAnomaly(void *a1, const char *a2, ...)
{
  return [a1 predictedTimeUntilAnomaly];
}

id objc_msgSend_predictedTimeUntilCongestion(void *a1, const char *a2, ...)
{
  return [a1 predictedTimeUntilCongestion];
}

id objc_msgSend_predictedTimesUntilAnomaly(void *a1, const char *a2, ...)
{
  return [a1 predictedTimesUntilAnomaly];
}

id objc_msgSend_predictionSourceOf(void *a1, const char *a2, ...)
{
  return [a1 predictionSourceOf];
}

id objc_msgSend_predictionSources(void *a1, const char *a2, ...)
{
  return [a1 predictionSources];
}

id objc_msgSend_predictionSuppressionReason(void *a1, const char *a2, ...)
{
  return [a1 predictionSuppressionReason];
}

id objc_msgSend_predictionTime(void *a1, const char *a2, ...)
{
  return [a1 predictionTime];
}

id objc_msgSend_predictionTimestamp(void *a1, const char *a2, ...)
{
  return [a1 predictionTimestamp];
}

id objc_msgSend_prepareForShutdown(void *a1, const char *a2, ...)
{
  return [a1 prepareForShutdown];
}

id objc_msgSend_prevCellOf(void *a1, const char *a2, ...)
{
  return [a1 prevCellOf];
}

id objc_msgSend_prevCells(void *a1, const char *a2, ...)
{
  return [a1 prevCells];
}

id objc_msgSend_prevValues(void *a1, const char *a2, ...)
{
  return [a1 prevValues];
}

id objc_msgSend_prevVisit(void *a1, const char *a2, ...)
{
  return [a1 prevVisit];
}

id objc_msgSend_prevVisitOf(void *a1, const char *a2, ...)
{
  return [a1 prevVisitOf];
}

id objc_msgSend_prevVisits(void *a1, const char *a2, ...)
{
  return [a1 prevVisits];
}

id objc_msgSend_previousCrowdsourcedOOSInsights(void *a1, const char *a2, ...)
{
  return [a1 previousCrowdsourcedOOSInsights];
}

id objc_msgSend_primary(void *a1, const char *a2, ...)
{
  return [a1 primary];
}

id objc_msgSend_psPref(void *a1, const char *a2, ...)
{
  return [a1 psPref];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_radioAccessTechnology(void *a1, const char *a2, ...)
{
  return [a1 radioAccessTechnology];
}

id objc_msgSend_radioState(void *a1, const char *a2, ...)
{
  return [a1 radioState];
}

id objc_msgSend_radioTechnology(void *a1, const char *a2, ...)
{
  return [a1 radioTechnology];
}

id objc_msgSend_rat(void *a1, const char *a2, ...)
{
  return [a1 rat];
}

id objc_msgSend_rawCellularRadioTech(void *a1, const char *a2, ...)
{
  return [a1 rawCellularRadioTech];
}

id objc_msgSend_receivedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 receivedTimestamp];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_registerAirplaneModeCallbacks(void *a1, const char *a2, ...)
{
  return [a1 registerAirplaneModeCallbacks];
}

id objc_msgSend_registrationDisplayStatus(void *a1, const char *a2, ...)
{
  return [a1 registrationDisplayStatus];
}

id objc_msgSend_registrationState(void *a1, const char *a2, ...)
{
  return [a1 registrationState];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAsDelegate(void *a1, const char *a2, ...)
{
  return [a1 removeAsDelegate];
}

id objc_msgSend_rsrp(void *a1, const char *a2, ...)
{
  return [a1 rsrp];
}

id objc_msgSend_rsrq(void *a1, const char *a2, ...)
{
  return [a1 rsrq];
}

id objc_msgSend_rxByteCounter(void *a1, const char *a2, ...)
{
  return [a1 rxByteCounter];
}

id objc_msgSend_rxPacketCounter(void *a1, const char *a2, ...)
{
  return [a1 rxPacketCounter];
}

id objc_msgSend_secondary(void *a1, const char *a2, ...)
{
  return [a1 secondary];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return [a1 seconds];
}

id objc_msgSend_secondsCongestionDuration(void *a1, const char *a2, ...)
{
  return [a1 secondsCongestionDuration];
}

id objc_msgSend_secondsUntilCongestion(void *a1, const char *a2, ...)
{
  return [a1 secondsUntilCongestion];
}

id objc_msgSend_seenCount(void *a1, const char *a2, ...)
{
  return [a1 seenCount];
}

id objc_msgSend_selectPredictedCellBasedOnSeenCountLikelihood(void *a1, const char *a2, ...)
{
  return [a1 selectPredictedCellBasedOnSeenCountLikelihood];
}

id objc_msgSend_sendCrowdsourcedPredictionLikelihood(void *a1, const char *a2, ...)
{
  return [a1 sendCrowdsourcedPredictionLikelihood];
}

id objc_msgSend_sendOOSPredictionsToBaseband(void *a1, const char *a2, ...)
{
  return [a1 sendOOSPredictionsToBaseband];
}

id objc_msgSend_sendOnDevicePredictionLikelihood(void *a1, const char *a2, ...)
{
  return [a1 sendOnDevicePredictionLikelihood];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signalBarState(void *a1, const char *a2, ...)
{
  return [a1 signalBarState];
}

id objc_msgSend_sinr(void *a1, const char *a2, ...)
{
  return [a1 sinr];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startLocationUpdates(void *a1, const char *a2, ...)
{
  return [a1 startLocationUpdates];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_startTimestamp(void *a1, const char *a2, ...)
{
  return [a1 startTimestamp];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stewieState(void *a1, const char *a2, ...)
{
  return [a1 stewieState];
}

id objc_msgSend_stopLocationUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopLocationUpdates];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return [a1 stopObserving];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_submitToCA(void *a1, const char *a2, ...)
{
  return [a1 submitToCA];
}

id objc_msgSend_subsId(void *a1, const char *a2, ...)
{
  return [a1 subsId];
}

id objc_msgSend_subscribeToTrial(void *a1, const char *a2, ...)
{
  return [a1 subscribeToTrial];
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return [a1 subscriptionID];
}

id objc_msgSend_subscriptionInfoDidChange(void *a1, const char *a2, ...)
{
  return [a1 subscriptionInfoDidChange];
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsInUse];
}

id objc_msgSend_tacOrLac(void *a1, const char *a2, ...)
{
  return [a1 tacOrLac];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeOfDay(void *a1, const char *a2, ...)
{
  return [a1 timeOfDay];
}

id objc_msgSend_timeUntilAnomaly(void *a1, const char *a2, ...)
{
  return [a1 timeUntilAnomaly];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_toBars(void *a1, const char *a2, ...)
{
  return [a1 toBars];
}

id objc_msgSend_toCell(void *a1, const char *a2, ...)
{
  return [a1 toCell];
}

id objc_msgSend_toCellGCI(void *a1, const char *a2, ...)
{
  return [a1 toCellGCI];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_txByteCounter(void *a1, const char *a2, ...)
{
  return [a1 txByteCounter];
}

id objc_msgSend_txPacketCounter(void *a1, const char *a2, ...)
{
  return [a1 txPacketCounter];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeAsString(void *a1, const char *a2, ...)
{
  return [a1 typeAsString];
}

id objc_msgSend_ulBottleneckScoreAsString(void *a1, const char *a2, ...)
{
  return [a1 ulBottleneckScoreAsString];
}

id objc_msgSend_ulBottleneckScoreHigh(void *a1, const char *a2, ...)
{
  return [a1 ulBottleneckScoreHigh];
}

id objc_msgSend_ulBottleneckScoreInvalid(void *a1, const char *a2, ...)
{
  return [a1 ulBottleneckScoreInvalid];
}

id objc_msgSend_ulBottleneckScoreLow(void *a1, const char *a2, ...)
{
  return [a1 ulBottleneckScoreLow];
}

id objc_msgSend_ulBottleneckScoreMedium(void *a1, const char *a2, ...)
{
  return [a1 ulBottleneckScoreMedium];
}

id objc_msgSend_ulBottleneckScoreNo(void *a1, const char *a2, ...)
{
  return [a1 ulBottleneckScoreNo];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateTreatment(void *a1, const char *a2, ...)
{
  return [a1 updateTreatment];
}

id objc_msgSend_updateUuidContextMap(void *a1, const char *a2, ...)
{
  return [a1 updateUuidContextMap];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidToContextMap(void *a1, const char *a2, ...)
{
  return [a1 uuidToContextMap];
}

id objc_msgSend_validPredictionDuration(void *a1, const char *a2, ...)
{
  return [a1 validPredictionDuration];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_waitForDeviceUnlockAndLoadDataStore(void *a1, const char *a2, ...)
{
  return [a1 waitForDeviceUnlockAndLoadDataStore];
}

id objc_msgSend_wasChargedSinceLastSubmission(void *a1, const char *a2, ...)
{
  return [a1 wasChargedSinceLastSubmission];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}