@interface StateOfMindChartViewController
- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12;
- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15;
- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13;
- (void)didTapOnDateFromCurrentValueView:(id)a3;
@end

@implementation StateOfMindChartViewController

- (void)didTapOnDateFromCurrentValueView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25603F188();
}

- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  v37[0] = a9;
  v37[1] = self;
  sub_2560406AC(0, &qword_269F45188, MEMORY[0x263F07920]);
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)v37 - v19;
  sub_2560406AC(0, (unint64_t *)&qword_269F44D30, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v21 - 8);
  v23 = (char *)v37 - v22;
  if (a10)
  {
    sub_256175818();
    uint64_t v24 = sub_256175868();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_256175868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v23, 1, 1, v25);
  }
  if (a11)
  {
    sub_256175988();
    uint64_t v26 = sub_256175A08();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v20, 0, 1, v26);
  }
  else
  {
    uint64_t v27 = sub_256175A08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v20, 1, 1, v27);
  }
  id v28 = a3;
  id v29 = a4;
  id v30 = a5;
  id v31 = a6;
  id v32 = a7;
  id v33 = a8;
  id v34 = v37[0];
  v35 = (_TtC14MentalHealthUI30StateOfMindChartViewController *)sub_25603F6C4((uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v23, (uint64_t)v20, a12);

  return v35;
}

- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13
{
  v40 = self;
  id v38 = a8;
  id v39 = a10;
  id v36 = a7;
  id v37 = a9;
  sub_2560406AC(0, &qword_269F45188, MEMORY[0x263F07920]);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v35 - v17;
  sub_2560406AC(0, (unint64_t *)&qword_269F44D30, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v35 - v20;
  sub_255FB58F8(0, (unint64_t *)&qword_269F45190);
  sub_255FB58F8(0, &qword_269F45198);
  sub_256040528();
  uint64_t v35 = sub_256177DE8();
  if (a11)
  {
    sub_256175818();
    uint64_t v22 = sub_256175868();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_256175868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v21, 1, 1, v23);
  }
  if (a12)
  {
    sub_256175988();
    uint64_t v24 = sub_256175A08();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v18, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_256175A08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v18, 1, 1, v25);
  }
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = v36;
  id v30 = v38;
  id v31 = v37;
  id v32 = v39;
  id v33 = (_TtC14MentalHealthUI30StateOfMindChartViewController *)sub_25603F9C8(v35, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v21, (uint64_t)v18, a13);

  return v33;
}

- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  v53 = self;
  id v55 = a9;
  sub_2560406AC(0, &qword_269F45188, MEMORY[0x263F07920]);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v50 - v21;
  sub_2560404C0();
  uint64_t v52 = sub_256178008();
  if (a5)
  {
    sub_255FB58F8(0, &qword_269F451A8);
    uint64_t v51 = sub_256178008();
  }
  else
  {
    uint64_t v51 = 0;
  }
  id v54 = a7;
  if (a12)
  {
    id v23 = a6;
    id v24 = a7;
    id v25 = a8;
    id v26 = v55;
    id v27 = a10;
    id v28 = a11;
    id v29 = a15;
    id v30 = a13;
    id v31 = a4;
    swift_unknownObjectRetain();
    sub_2561784B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v56, 0, sizeof(v56));
    id v32 = a6;
    id v33 = a7;
    id v34 = a8;
    id v35 = v55;
    id v36 = a10;
    id v37 = a11;
    id v38 = a15;
    id v39 = a13;
    id v40 = a4;
  }
  if (a13)
  {
    sub_256175988();

    uint64_t v41 = sub_256175A08();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v22, 0, 1, v41);
  }
  else
  {
    uint64_t v42 = sub_256175A08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v22, 1, 1, v42);
  }
  if (a15)
  {
    sub_255FB58F8(0, (unint64_t *)&qword_269F45190);
    sub_255FB58F8(0, &qword_269F45198);
    sub_256040528();
    uint64_t v43 = sub_256177DE8();
  }
  else
  {
    uint64_t v43 = 0;
  }
  uint64_t v49 = v43;
  uint64_t v48 = (uint64_t)v22;
  id v44 = v54;
  id v45 = v55;
  v46 = (_TtC14MentalHealthUI30StateOfMindChartViewController *)sub_25603FD34(v52, (uint64_t)a4, v51, (uint64_t)a6, (uint64_t)v54, (uint64_t)a8, (uint64_t)v55, (uint64_t)a10, (uint64_t)a11, (uint64_t)v56, v48, a14, v49);

  return v46;
}

@end