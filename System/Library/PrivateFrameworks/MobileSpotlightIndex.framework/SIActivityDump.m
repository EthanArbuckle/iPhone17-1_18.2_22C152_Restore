@interface SIActivityDump
@end

@implementation SIActivityDump

void ___SIActivityDump_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  memset(v57, 0, 256);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  int v4 = *a2;
  int v5 = *a2 - 1;
  *(_OWORD *)v41 = 0u;
  long long v42 = 0u;
  v6 = "CreateIndex";
  switch(v5)
  {
    case 0:
    case 36:
      break;
    case 1:
    case 32:
    case 37:
      v6 = "OpenIndex";
      break;
    case 2:
    case 33:
    case 38:
      v6 = "OpenIndexShadow";
      break;
    case 3:
    case 6:
    case 7:
    case 34:
    case 35:
LABEL_13:
      v14 = *(FILE **)(a1 + 48);
      get_date_string(*(__CFCalendar **)(a1 + 56), v57, *((CFAbsoluteTime *)a2 + 3));
      fprintf(v14, "%s time: %s\n");
      return;
    case 4:
    case 39:
      v6 = "SyncIndex";
      break;
    case 5:
LABEL_26:
      time_t v40 = *((void *)a2 + 4);
      v17 = localtime(&v40);
      strftime(v41, 0x100uLL, "%F %T", v17);
      v18 = *(FILE **)(a1 + 48);
      get_date_string(*(__CFCalendar **)(a1 + 56), v57, *((CFAbsoluteTime *)a2 + 3));
      fprintf(v18, "%s time: %s recoverTimeStamp:%s (%ld)\n");
      goto LABEL_40;
    case 8:
    case 9:
    case 15:
    case 31:
    case 40:
    case 41:
    case 42:
    case 43:
      return;
    case 10:
    case 27:
    case 28:
      v6 = "AddItem";
      break;
    case 11:
    case 13:
    case 14:
LABEL_20:
      v16 = *(FILE **)(a1 + 48);
      if (a2[3]) {
        fprintf(v16, "%s oid: 0x%llx %lld transaction: %d\n");
      }
      else {
        fprintf(v16, "%s oid: 0x%llx %lld\n");
      }
LABEL_52:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      return;
    case 12:
    case 29:
    case 30:
      v6 = "UpdateItem";
      break;
    case 16:
    case 17:
    case 18:
    case 53:
LABEL_14:
      uint64_t v15 = *((void *)a2 + 3);
      if ((HIDWORD(v15) == 716189596 || HIDWORD(v15) == 510259174) && (v15 & 0x80000000) == 0 && v15) {
        fprintf(*(FILE **)(a1 + 48), "%s id: %d oid: 0x%llx %lld\n");
      }
      else {
        fprintf(*(FILE **)(a1 + 48), "%s oid: 0x%llx %lld\n");
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
      return;
    case 19:
LABEL_32:
      fprintf(*(FILE **)(a1 + 48), "NewLiveIndex position: %d base: %lld\n");
      return;
    case 20:
    case 21:
LABEL_24:
      fprintf(*(FILE **)(a1 + 48), "%s position: %d count: %d\n");
      return;
    case 22:
LABEL_33:
      fprintf(*(FILE **)(a1 + 48), "NewBundleGroup %d 0x%x %s\n");
      return;
    case 23:
    case 24:
    case 51:
    case 52:
LABEL_19:
      fprintf(*(FILE **)(a1 + 48), "%s journal.%d\n");
      return;
    case 25:
LABEL_34:
      v23 = *(FILE **)(a1 + 48);
      v24 = "Playback start\n";
      size_t v25 = 15;
      goto LABEL_36;
    case 26:
LABEL_35:
      v23 = *(FILE **)(a1 + 48);
      v24 = "Playback end\n";
      size_t v25 = 13;
LABEL_36:
      fwrite(v24, v25, 1uLL, v23);
      return;
    case 44:
    case 46:
    case 49:
      v6 = "AddMailItem";
      break;
    case 45:
    case 47:
    case 48:
    case 50:
      v6 = "UpdateMailItem";
      break;
    case 54:
LABEL_39:
      v26 = *(FILE **)(a1 + 48);
      get_date_string(*(__CFCalendar **)(a1 + 56), v57, *((CFAbsoluteTime *)a2 + 3));
      fprintf(v26, "Journal was reset at time %s, size before reset: %llu, size after reset: %llu\n");
LABEL_40:
      uint64_t v27 = *((void *)a2 + 3);
      goto LABEL_50;
    case 55:
LABEL_41:
      v28 = *(FILE **)(a1 + 48);
      get_date_string(*(__CFCalendar **)(a1 + 56), v57, *((CFAbsoluteTime *)a2 + 4));
      fprintf(v28, "%s pid: %d time: %s build: %s\n");
      goto LABEL_49;
    case 57:
LABEL_42:
      v29 = *(FILE **)(a1 + 48);
      if (a2[13]) {
        fprintf(v29, "%s[%u] id: %llu hash: %llx sz: %lu %s\n");
      }
      else {
        fprintf(v29, "%s[%u] id: %llu hash: %llx sz: %lu\n");
      }
      return;
    case 58:
LABEL_58:
      fprintf(*(FILE **)(a1 + 48), "%s[%u] %s/%s cnt:%u\n");
      return;
    default:
      v6 = "Unknown";
      break;
  }
  v7 = v6;
  switch(v5)
  {
    case 0:
    case 1:
    case 2:
    case 32:
    case 33:
    case 36:
    case 37:
    case 38:
      if ((v4 - 37) <= 2)
      {
        time_t v40 = *((void *)a2 + 9);
        time_t v8 = v40;
        v9 = localtime(&v40);
        strftime(v41, 0x100uLL, "%F %T", v9);
        v10 = *(FILE **)(a1 + 48);
        uint64_t v11 = a2[6];
        date_string = get_date_string(*(__CFCalendar **)(a1 + 56), v57, *((CFAbsoluteTime *)a2 + 4));
        v38 = v41;
        time_t v39 = v8;
        uint64_t v36 = *((void *)a2 + 7);
        uint64_t v37 = *((void *)a2 + 8);
        uint64_t v34 = a2[11];
        uint64_t v35 = a2[12];
        v32 = date_string;
        uint64_t v33 = a2[10];
        v13 = "%s pid: %d time: %s syncCount: %d scanCount: %d liveCount: %d serialNumber: %lld consumedSerialNumber: %ll"
              "d recoverTimeStamp:%s (%ld)\n";
        uint64_t v31 = v11;
LABEL_31:
        fprintf(v10, v13, v7, v31, v32, v33, v34, v35, v36, v37, v38, v39);
        goto LABEL_49;
      }
      unsigned int v20 = v4 - 33;
      uint64_t v21 = a2[6];
      v10 = *(FILE **)(a1 + 48);
      v22 = get_date_string(*(__CFCalendar **)(a1 + 56), v57, *((CFAbsoluteTime *)a2 + 4));
      if (v20 <= 1)
      {
        uint64_t v36 = *((void *)a2 + 7);
        uint64_t v37 = *((void *)a2 + 8);
        uint64_t v34 = a2[11];
        uint64_t v35 = a2[12];
        v32 = v22;
        uint64_t v33 = a2[10];
        v13 = "%s pid: %d time: %s syncCount: %d scanCount: %d liveCount: %d serialNumber: %lld consumedSerialNumber: %lld\n";
        uint64_t v31 = v21;
        goto LABEL_31;
      }
      fprintf(v10, "%s pid: %d time: %s syncCount: %d scanCount: %d liveCount: %d\n");
LABEL_49:
      uint64_t v27 = *((void *)a2 + 4);
LABEL_50:
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v27;
      write_timeline(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = write_timeline_result;
      return;
    case 3:
    case 4:
    case 6:
    case 7:
    case 34:
    case 35:
      goto LABEL_13;
    case 5:
    case 39:
      goto LABEL_26;
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      goto LABEL_20;
    case 16:
    case 17:
    case 18:
    case 53:
      goto LABEL_14;
    case 19:
      goto LABEL_32;
    case 20:
    case 21:
      goto LABEL_24;
    case 22:
      goto LABEL_33;
    case 23:
    case 24:
    case 51:
    case 52:
      goto LABEL_19;
    case 25:
      goto LABEL_34;
    case 26:
      goto LABEL_35;
    case 27:
    case 28:
    case 29:
    case 30:
      v19 = *(FILE **)(a1 + 48);
      if (a2[3]) {
        fprintf(v19, "%s transaction: %d id: %s oid: 0x%llx serial: %lld\n");
      }
      else {
        fprintf(v19, "%s id: %s oid: 0x%llx serial: %lld\n");
      }
      goto LABEL_52;
    case 44:
    case 45:
      v30 = *(FILE **)(a1 + 48);
      if (a2[3]) {
        fprintf(v30, "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d\n");
      }
      else {
        fprintf(v30, "%s id: %s oid: 0x%llx serial: %lld read: %d\n");
      }
      goto LABEL_55;
    case 46:
    case 47:
      fprintf(*(FILE **)(a1 + 48), "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d flagged: %d\n", v6);
      goto LABEL_55;
    case 48:
      fprintf(*(FILE **)(a1 + 48), "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d flagged: %d color: <null>\n", v6);
      goto LABEL_55;
    case 49:
    case 50:
      fprintf(*(FILE **)(a1 + 48), "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d flagged: %d color: %d\n", v6);
LABEL_55:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44);
      return;
    case 54:
      goto LABEL_39;
    case 55:
      goto LABEL_41;
    case 56:
      fprintf(*(FILE **)(a1 + 48), "%s\n");
      return;
    case 57:
      goto LABEL_42;
    case 58:
      goto LABEL_58;
    default:
      return;
  }
}

@end